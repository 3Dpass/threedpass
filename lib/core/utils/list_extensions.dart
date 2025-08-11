extension ListExtensions<E> on List<E> {
  void replace(final E element, final E replacement) {
    final i = indexOf(element);
    this[i] = replacement;
  }

  E? firstWhereOrNull(final bool Function(E elem) test) {
    for (final element in this) {
      if (test(element)) {
        return element;
      }
    }

    return null;
  }

  R whenNotEmpty<R>({
    required final R Function(List<E> list) notEmpty,
    required final R Function() empty,
  }) =>
      isEmpty ? empty() : notEmpty(this);
}
