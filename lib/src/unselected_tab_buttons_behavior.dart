/// Defines how tab buttons behave when the tab is not selected.
///
/// This setting only applies to unselected tabs.
/// Once a tab is selected, all buttons are always enabled.
enum UnselectedTabButtonsBehavior {
  /// All buttons are disabled on unselected tabs.
  allDisabled,

  /// All buttons remain enabled even if the tab is not selected.
  allEnabled,

  /// Only the close button is enabled on unselected tabs.
  onlyClose
}
