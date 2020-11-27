import 'dart:convert';

import 'package:flutter/material.dart';

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
    @required this.homeRepository,
    @required this.dataManager,
  });

  @override
  Future<List<RecordEntity>> getDataStore(
      {String resource_id, int limit}) async {
    final localJson = dataManager.getDataStore();

    if (localJson?.isNotEmpty ?? false) {
      final localData = DataStoreModel.fromJson(jsonDecode(localJson));
      return handleRecordEntity(localData);
    }

    final data = await homeRepository.getDataStore(
        resource_id: resource_id, limit: limit);
    dataManager.saveDataStore(jsonEncode(data.toJson()));

    return handleRecordEntity(data);
  }

  List<RecordEntity> handleRecordEntity(DataStoreModel data) {
    if (data.result.records.isNotEmpty) {
      final records = <RecordEntity>[];
      var current = data.result.records.first;
      var volume = 0.0;
      var decrease = true;

      data.result.records.forEach((element) {
        if (current.year == element.year) {
          decrease = decrease &&
              double.parse(element.volume_of_mobile_data) >=
                  double.parse(current.volume_of_mobile_data);
          volume += double.parse(element.volume_of_mobile_data);
        } else {
          records.add(RecordEntity(
            volume_of_mobile_data: volume.toString(),
            decrease: decrease,
            quarter: element.quarter,
          ));
          volume = double.parse(element.volume_of_mobile_data);
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
