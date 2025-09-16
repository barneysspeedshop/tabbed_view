/// Defines how tab headers are sized relative to each other
/// along their extent (the thickness of the header).
///
/// Depending on the tab placement:
///  * For tabs placed horizontally (top or bottom), the extent is the height.
///  * For tabs placed vertically (left or right), the extent is the width.
///  * For stacked vertical tabs, the extent is again the height.
///
/// A tab header refers only to the inner area of a tab
/// (label, optional buttons, and padding), excluding
/// borders and external decorations.
///
/// This setting only affects the relationship between
/// tab headers themselves. It does not control how the
/// overall tabs area fits within its container — for that,
/// see [TabsAreaCrossAxisFit].
enum TabHeaderExtentBehavior {
  /// Each tab header determines its own extent based on
  /// its intrinsic content.
  individual,

  /// All tab headers have exactly the same extent.
  uniform,
}
