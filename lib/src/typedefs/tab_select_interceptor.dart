/// Called only when the user requests to select a tab through the interface,
/// for example by clicking or tapping on a tab header.
///
/// This interceptor is **not triggered** when the selected tab is changed
/// programmatically through the [TabbedViewController].
///
/// Return `true` to allow the selection, or `false` to prevent it.
typedef TabSelectInterceptor = bool Function(int newTabIndex);
