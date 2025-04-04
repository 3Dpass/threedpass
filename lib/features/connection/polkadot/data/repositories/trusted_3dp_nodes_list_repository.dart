abstract class Trusted3dpNodesListRepository {
  Future<List<String>> trustedNodesList();
}

class Trusted3dpNodesListRepositoryImpl
    implements Trusted3dpNodesListRepository {
  @override
  Future<List<String>> trustedNodesList() {
    return Future.value([
      'wss://rpc.3dpass.org',
      'wss://rpc2.3dpass.org',
      'wss://rpc3.3dpass.org',
    ]);
  }
}
