class BloatedResponse<TReq, TData> {
  TReq request;
  TData data;

  BloatedResponse({
    required this.data,
    required this.request,
  });
}
