import 'package:json_annotation/json_annotation.dart';
import '../models/record_model.dart';

part 'record_entity.g.dart';
// ignore_for_file: overridden_fields

@JsonSerializable()
class RecordEntity extends RecordModel {
  RecordEntity({
    required this.volumeOfMobileData,
    required this.decrease,
    this.quarter,
  }) : super(
          id: 1,
          volumeOfMobileData: volumeOfMobileData,
          quarter: quarter,
        );

  @override
  @JsonKey(name: 'volume_of_mobile_data')
  final String volumeOfMobileData;
  final bool decrease;
  @override
  final String? quarter;

  factory RecordEntity.fromJson(Map<String, dynamic> json) =>
      _$RecordEntityFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$RecordEntityToJson(this);
}
