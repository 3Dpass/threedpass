import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:threedpass/core/utils/logger.dart';
import 'package:threedpass/core/utils/validators.dart';

abstract class Public3dpNodesListRepository {
  const Public3dpNodesListRepository();

  Future<List<String>> publicNodesList();
  Future<bool> checkReachable(String url);

  static const listOfNodesRepo = 'https://github.com/3Dpass/rpc-list';
  static const listOfNodesUrl =
      'https://raw.githubusercontent.com/3Dpass/rpc-list/refs/heads/main/list.txt';
}

class Public3dpNodesListRepositoryImpl implements Public3dpNodesListRepository {
  const Public3dpNodesListRepositoryImpl({required this.dio});

  final Dio dio;

  @override
  Future<List<String>> publicNodesList() async {
    final response =
        await dio.request(Public3dpNodesListRepository.listOfNodesUrl);
    final publicNodes = (response.data!.split('\n') as List<String>)
        .where(
          (final e) => Validators.nodeUrl(e),
        )
        .toList();
    logger.t('Public nodes (${publicNodes.length}): $publicNodes');
    return Future.value(publicNodes);
  }

  @override
  Future<bool> checkReachable(final String url) async {
    WebSocket? ws;
    try {
      ws = await WebSocket.connect(url).timeout(const Duration(seconds: 5));
      ws.add(jsonEncode({
        'id': 1,
        'jsonrpc': '2.0',
        'method': 'system_health',
        'params': [],
      }));
      final message = await ws.first.timeout(const Duration(seconds: 5));
      if (message is! String) {
        logger.w('Node not reachable (non-string frame): $url');
        return false;
      }
      final decoded = jsonDecode(message);
      final isValid = decoded is Map &&
          decoded['id'] == 1 &&
          decoded['jsonrpc'] == '2.0' &&
          decoded.containsKey('result');
      logger.t('Node reachable=$isValid: $url');
      return isValid;
    } catch (e) {
      logger.w('Node not reachable: $url — $e');
      return false;
    } finally {
      await ws?.close();
    }
  }
}
