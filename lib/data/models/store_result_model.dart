import 'package:json_annotation/json_annotation.dart';

import 'record_model.dart';

part 'store_result_model.g.dart';

@JsonSerializable()
class StoreResultModel {
  StoreResultModel({
    required this.resourceId,
    required this.records,
    this.limit,
    this.total,
  });

  @JsonKey(name: 'resource_id')
  final String resourceId;

  final List<RecordModel> records;
  final int? limit;
  final int? total;

  factory StoreResultModel.fromJson(Map<String, dynamic> json) =>
      _$StoreResultModelFromJson(json);
  Map<String, dynamic> toJson() => _$StoreResultModelToJson(this);
}
