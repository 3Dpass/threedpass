import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:threedpass/features/rest/models/transfers_response.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;

  @GET('https://api.3dpscan.xyz/accounts/{address}/transfers')
  Future<TransfersResponse> getTransfers(
    @Path('address') String address,
    @Query('page') int page,
    @Query('page_size') int pageSize,
  );
}
