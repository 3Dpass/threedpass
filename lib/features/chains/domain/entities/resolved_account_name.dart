class ResolvedAccountName {
  final String name;
  final ResolvedNameSource source;

  const ResolvedAccountName({
    required this.name,
    required this.source,
  });
}

enum ResolvedNameSource {
  onChainIdentity,
  accounts,
  contacts,
}
