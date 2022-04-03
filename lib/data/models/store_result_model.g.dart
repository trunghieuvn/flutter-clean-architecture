// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreResultModel _$StoreResultModelFromJson(Map<String, dynamic> json) =>
    StoreResultModel(
      resourceId: json['resource_id'] as String,
      records: (json['records'] as List<dynamic>)
          .map((e) => RecordModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      limit: json['limit'] as int?,
      total: json['total'] as int?,
    );

Map<String, dynamic> _$StoreResultModelToJson(StoreResultModel instance) =>
    <String, dynamic>{
      'resource_id': instance.resourceId,
      'records': instance.records,
      'limit': instance.limit,
      'total': instance.total,
    };
