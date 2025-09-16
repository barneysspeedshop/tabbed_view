/// Defines the position of the tab bar.
enum TabBarPosition {
  /// Positions the tab bar above the content.
  top(true),

  /// Positions the tab bar below the content.
  bottom(true),

  /// Positions the tab bar on the left of the content.
  left(false),

  /// Positions the tab bar on the right of the content.
  right(false);

  const TabBarPosition(this.isHorizontal);

  final bool isHorizontal;

  bool get isVertical => !isHorizontal;
}
