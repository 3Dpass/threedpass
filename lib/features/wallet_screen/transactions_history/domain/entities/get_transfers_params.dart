class GetTransfersParams {
  final int page;
  final int pageSize;
  final String address;

  const GetTransfersParams({
    required this.page,
    required this.address,
    this.pageSize = 25,
  });
}
