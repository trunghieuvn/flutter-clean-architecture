import 'package:flutter_test/flutter_test.dart';
import 'package:singapore_mobile_networks/data/entities/record_entity.dart';
import 'package:singapore_mobile_networks/data/models/record_model.dart';
import 'package:singapore_mobile_networks/data/models/store_result_model.dart';

import '../../mocks/mocks.dart';

void main() {
  test('should DataStoreModel convert model success', () {
    final data = dataStoreModelMock.toJson();

    expect(data['success'], true);
  });

  test('should ecordModelT convert model success', () {
    final model = RecordModel(volumeOfMobileData: '0.1', quarter: '2010');
    final json = model.toJson();
    expect(json['quarter'], '2010');
  });

  test('should StoreResultModel convert model success', () {
    final model = StoreResultModel(resourceId: 'resource_id', records: []);
    final json = model.toJson();
    expect(json['resource_id'], 'resource_id');
  });

  test('should RecordEntity convert model success', () {
    final model = RecordEntity(
        volumeOfMobileData: 'volume_of_mobile_data', decrease: true);
    final json = model.toJson();
    expect(json['volume_of_mobile_data'], 'volume_of_mobile_data');
    expect(RecordEntity.fromJson(json).volumeOfMobileData,
        'volume_of_mobile_data');
  });
}
