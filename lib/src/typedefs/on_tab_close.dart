import '../tab_data.dart';

/// The event triggered when the user closes a tab through the UI.
///
/// This callback is **not** called when tabs are removed programmatically
/// using [TabbedViewController.removeTab] or [TabbedViewController.removeTabs].
typedef OnTabClose = void Function(int tabIndex, TabData tabData);
