class AssetConversionRepositoryImpl {
  Future<void> getPools() async {
    """
var p = async () => {
  const pools = await api.query.assetConversion.pools.entries();
    return pools.map(([key, value]) => [key.args?.[0].toHuman(), value.toHuman()]);
};
""";
  }
}
