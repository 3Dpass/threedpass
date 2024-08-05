@Deprecated(
  'Use tuples like (String, String). final List<(String, Widget?)> menuItemList;',
)
class Pair<L, R> {
  final L left;
  final R right;

  const Pair(this.left, this.right);
}
