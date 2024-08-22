extension ListExtensions<E> on List<E> {
  bool replace(E element, E replacement) {
    var found = false;
    final len = length;
    for (var i = 0; i < len; i++) {
      if (element == this[i]) {
        this[i] = replacement;
        found = true;
      }
    }

    return found;
  }

  E? findOrNull(bool Function(E elem) test) {
    for (final element in this) {
      if (test(element)) {
        return element;
      }
    }

    return null;
  }
}
