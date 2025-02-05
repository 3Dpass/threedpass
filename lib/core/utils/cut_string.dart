extension CutString on String {
  String cut(final int max) {
    return length > max ? substring(0, max) : this;
  }

  /// Written entirely by Github Copilot
  String cutWithEllipsis(final int max) {
    return length > max ? substring(0, max) + '...' : this;
  }
}
