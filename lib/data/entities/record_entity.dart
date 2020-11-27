import 'package:json_annotation/json_annotation.dart';
import '../models/record_model.dart';

part 'record_entity.g.dart';

@JsonSerializable()
class RecordEntity extends RecordModel {
  RecordEntity({
    this.volume_of_mobile_data,
    this.decrease,
    this.quarter,
  });

  @override
  @JsonKey(name: 'volume_of_mobile_data')
  final String volume_of_mobile_data;
  @JsonKey(name: 'decrease')
  final bool decrease;
  @override
  @JsonKey(name: 'quarter')
  final String quarter;

  factory RecordEntity.fromJson(Map<String, dynamic> json) =>
      _$RecordEntityFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$RecordEntityToJson(this);
}
