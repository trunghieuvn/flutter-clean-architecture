import 'package:json_annotation/json_annotation.dart';

part 'record_model.g.dart';

@JsonSerializable()
class RecordModel {
  RecordModel({
     this.id,
    required this.volumeOfMobileData,
     this.quarter,
  });

  @JsonKey(name: 'volume_of_mobile_data')
  final String volumeOfMobileData;
  @JsonKey(name: 'quarter')
  final String? quarter;
  @JsonKey(name: '_id')
  final int? id;

  factory RecordModel.fromJson(Map<String, dynamic> json) =>
      _$RecordModelFromJson(json);
  Map<String, dynamic> toJson() => _$RecordModelToJson(this);

  String get year => quarter?.split('-').first ?? '';
}
