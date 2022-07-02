extension Cut on String {
  String cut(int max) {
    return length > max ? substring(0, max) : this;
  }
}
