import 'dart:convert';

import '../../../../../../common/utils.dart';
import '../../../../../../data/datasources/local/data_manager.dart';
import '../../../../../../data/entities/record_entity.dart';
import '../../../../../../data/models/data_store_model.dart';
import '../home_interactor.dart';
import '../home_repository.dart';

class HomeInteractorImpl extends HomeInteractor {
  final HomeRepository homeRepository;
  final DataManager dataManager;

  HomeInteractorImpl({
    required this.homeRepository,
    required this.dataManager,
  });

  @override
  Future<List<RecordEntity>> getDataStore(
      {required String resourceId, required int limit}) async {
    final localJson = dataManager.getDataStore();

    if (localJson.isNotEmpty) {
      final localData = DataStoreModel.fromJson(
          jsonDecode(localJson) as Map<String, dynamic>);
      return handleRecordEntity(localData);
    }

    final data = await homeRepository.getDataStore(
        resourceId: resourceId, limit: limit);
    dataManager.saveDataStore(jsonEncode(data.toJson()));

    return handleRecordEntity(data);
  }

  List<RecordEntity> handleRecordEntity(DataStoreModel data) {
    if (data.result.records.isNotEmpty) {
      final records = <RecordEntity>[];
      var current = data.result.records.first;
      var volume = 0.0;
      var decrease = true;

      // ignore: avoid_function_literals_in_foreach_calls
      data.result.records.forEach((element) {
        if (current.year == element.year) {
          decrease = decrease &&
              double.parse(element.volumeOfMobileData) >=
                  double.parse(current.volumeOfMobileData);
          volume += double.parse(element.volumeOfMobileData);
        } else {
          records.add(RecordEntity(
            volumeOfMobileData: volume.toString(),
            decrease: decrease,
            quarter: element.quarter,
          ));
          volume = double.parse(element.volumeOfMobileData);
          decrease = true;
        }
        current = element;
      });
      LogUtils.d('[HomeInteractor] ${records.length}');
      return records;
    }
    return [];
  }
}
