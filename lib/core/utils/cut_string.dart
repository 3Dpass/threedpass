extension Cut on String {
  String cut(int max) {
    return length > max ? substring(0, max) : this;
  }

  /// Written entirely by Github Copilot
  String cutWithEllipsis(int max) {
    return length > max ? substring(0, max) + '...' : this;
  }
}
