import 'package:dio/dio.dart';
import 'package:threedpass/core/utils/logger.dart';
import 'package:threedpass/core/utils/validators.dart';

abstract class PublicExplorerListRepository {
  const PublicExplorerListRepository();

  Future<List<String>> publicExplorersList();
  Future<bool> checkReachable(String url);

  static const listOfExplorersUrl =
      'https://raw.githubusercontent.com/3Dpass/rpc-list/refs/heads/main/explorer_urls_list.txt';
}

class PublicExplorerListRepositoryImpl implements PublicExplorerListRepository {
  const PublicExplorerListRepositoryImpl({required this.dio});

  final Dio dio;

  @override
  Future<List<String>> publicExplorersList() async {
    final response =
        await dio.request(PublicExplorerListRepository.listOfExplorersUrl);
    final list = (response.data!.split('\n') as List<String>)
        .where((final e) => Validators.explorerUrl(e))
        .toList();
    logger.t('Public explorers (${list.length}): $list');
    return list;
  }

  @override
  Future<bool> checkReachable(final String url) async {
    try {
      final base = url.endsWith('/') ? url : '$url/';
      final response = await dio.get(
        '${base}blocks/1',
        options: Options(
          receiveTimeout: const Duration(seconds: 5),
          sendTimeout: const Duration(seconds: 5),
          responseType: ResponseType.json,
        ),
      );
      final data = response.data;
      final ok = data is Map && data.containsKey('time');
      logger.t('Explorer reachable=$ok: $url');
      return ok;
    } catch (e) {
      logger.w('Explorer not reachable: $url — $e');
      return false;
    }
  }
}
