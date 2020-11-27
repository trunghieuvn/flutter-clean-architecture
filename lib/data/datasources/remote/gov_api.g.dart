// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gov_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _GovApi implements GovApi {
  _GovApi(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<DataStoreModel> getDataStore(resource_id, limit) async {
    ArgumentError.checkNotNull(resource_id, 'resource_id');
    ArgumentError.checkNotNull(limit, 'limit');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'action/datastore_search?resource_id=$resource_id&limit=$limit',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = DataStoreModel.fromJson(_result.data);
    return value;
  }
}
