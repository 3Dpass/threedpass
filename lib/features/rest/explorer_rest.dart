import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:threedpass/features/rest/models/block_response.dart';
import 'package:threedpass/features/rest/models/transfers_response.dart';

part 'explorer_rest.g.dart';

@RestApi(baseUrl: 'https://api.3dpscan.xyz')
abstract class ExplorerRest {
  factory ExplorerRest(Dio dio) = _ExplorerRest;

  @GET('/accounts/{address}/transfers')
  Future<TransfersResponse> getTransfers(
    @Path('address') String address,
    @Query('page') int page,
    @Query('page_size') int pageSize,
  );

  @GET('/blocks/{height}')
  Future<BlockResponse> getBlock(
    @Path('height') int blockHeight,
  );
}
