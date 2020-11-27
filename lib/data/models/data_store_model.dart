import 'package:json_annotation/json_annotation.dart';

import 'store_result_model.dart';

part 'data_store_model.g.dart';

@JsonSerializable()
class DataStoreModel {
  DataStoreModel({
    this.help,
    this.success,
    this.result,
  });

  @JsonKey(name: 'help')
  final String help;
  @JsonKey(name: 'success')
  final bool success;
  @JsonKey(name: 'result')
  final StoreResultModel result;

  factory DataStoreModel.fromJson(Map<String, dynamic> json) =>
      _$DataStoreModelFromJson(json);
  Map<String, dynamic> toJson() => _$DataStoreModelToJson(this);
}
