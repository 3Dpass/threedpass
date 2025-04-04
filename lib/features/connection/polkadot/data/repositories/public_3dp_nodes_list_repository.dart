import 'package:dio/dio.dart';

abstract class Public3dpNodesListRepository {
  const Public3dpNodesListRepository();

  Future<List<String>> publicNodesList();

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
    print(response.data);
    return Future.value(response.data!.split('\n'));
  }
}
