import 'package:json_annotation/json_annotation.dart';

import 'record_model.dart';

part 'store_result_model.g.dart';

@JsonSerializable()
class StoreResultModel {
  StoreResultModel({
    this.resource_id,
    this.records,
    this.limit,
    this.total,
  });

  @JsonKey(name: 'resource_id')
  final String resource_id;
  @JsonKey(name: 'records')
  final List<RecordModel> records;
  @JsonKey(name: 'limit')
  final int limit;
  @JsonKey(name: 'total')
  final int total;

  factory StoreResultModel.fromJson(Map<String, dynamic> json) =>
      _$StoreResultModelFromJson(json);
  Map<String, dynamic> toJson() => _$StoreResultModelToJson(this);
}
