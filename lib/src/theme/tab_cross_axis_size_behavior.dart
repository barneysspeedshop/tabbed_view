/// Defines how tabs are sized relative to each other
/// in the cross axis direction (height if the tabs are
/// horizontal, width if the tabs are vertical).
///
/// This setting only affects the relationship between
/// tabs themselves. It does not control how the overall
/// tabs area fits within its container — for that,
/// see [TabsAreaCrossAxisFit].
enum TabCrossAxisSizeBehavior {
  /// Each tab determines its own cross size based on
  /// its intrinsic content.
  individual,

  /// All tabs have exactly the same cross size,
  /// including the selected one.
  uniform,

  /// All non-selected tabs share the same cross size,
  /// while the selected tab may have a different size.
  nonSelectedUniform
}
