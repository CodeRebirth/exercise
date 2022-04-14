import 'package:chopper/chopper.dart';
import 'package:exercise/const/url_const.dart';
part 'api_service.chopper.dart';

@ChopperApi(baseUrl: GET_MOVIES_LIST)
abstract class ApiService extends ChopperService {
  static _$ApiService create([ChopperClient? client]) => _$ApiService(client);

  @Get()
  Future<Response> getMovieList(
      @Query("limit") int? limit, @Query("offset") int? offset);

  @override
  Type get definitionType => throw UnimplementedError();
}
