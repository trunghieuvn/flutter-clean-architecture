// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecordEntity _$RecordEntityFromJson(Map<String, dynamic> json) {
  return RecordEntity(
    volumeOfMobileData: json['volume_of_mobile_data'] as String,
    decrease: json['decrease'] as bool,
    quarter: json['quarter'] as String?,
  );
}

Map<String, dynamic> _$RecordEntityToJson(RecordEntity instance) =>
    <String, dynamic>{
      'volume_of_mobile_data': instance.volumeOfMobileData,
      'decrease': instance.decrease,
      'quarter': instance.quarter,
    };
