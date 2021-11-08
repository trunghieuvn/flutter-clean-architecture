// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecordModel _$RecordModelFromJson(Map<String, dynamic> json) {
  return RecordModel(
    id: json['_id'] as int?,
    volumeOfMobileData: json['volume_of_mobile_data'] as String,
    quarter: json['quarter'] as String?,
  );
}

Map<String, dynamic> _$RecordModelToJson(RecordModel instance) =>
    <String, dynamic>{
      'volume_of_mobile_data': instance.volumeOfMobileData,
      'quarter': instance.quarter,
      '_id': instance.id,
    };
