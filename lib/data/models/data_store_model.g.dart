// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_store_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataStoreModel _$DataStoreModelFromJson(Map<String, dynamic> json) =>
    DataStoreModel(
      help: json['help'] as String,
      success: json['success'] as bool,
      result: StoreResultModel.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataStoreModelToJson(DataStoreModel instance) =>
    <String, dynamic>{
      'help': instance.help,
      'success': instance.success,
      'result': instance.result,
    };
