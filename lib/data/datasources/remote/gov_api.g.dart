// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gov_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _GovApi implements GovApi {
  _GovApi(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<DataStoreModel> getDataStore(resourceId, limit) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        DataStoreModel>(Options(
            method: 'GET', headers: _headers, extra: _extra)
        .compose(_dio.options,
            'action/datastore_search?resource_id=${resourceId}&limit=${limit}',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = DataStoreModel.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
