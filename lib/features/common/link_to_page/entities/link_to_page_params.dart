class LinkToPageParams {
  final String title;
  final Future<void> Function() onPressed;

  const LinkToPageParams({
    required this.title,
    required this.onPressed,
  });
}
