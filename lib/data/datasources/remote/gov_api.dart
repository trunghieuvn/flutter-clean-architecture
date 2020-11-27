import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../../models/data_store_model.dart';

part 'gov_api.g.dart';

@RestApi()
abstract class GovApi {
  factory GovApi(Dio dio, {String baseUrl}) = _GovApi;

  @GET('action/datastore_search?resource_id={resource_id}&limit={limit}')
  Future<DataStoreModel> getDataStore(
      @Path() String resource_id, @Path() int limit);
}
