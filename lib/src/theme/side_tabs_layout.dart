/// Defines how side-positioned tabs (left or right) are laid out.
enum SideTabsLayout {
  /// Tabs are stacked vertically, one above the other.
  ///
  /// Each tab keeps its text orientation horizontal,
  /// similar to a [Column] of tabs.
  stacked,

  /// Tabs are arranged in a row and then rotated 90 degrees
  /// to fit on the side.
  ///
  /// This makes the text orientation vertical,
  /// and the tabs appear side-by-side along the edge.
  rotated
}
