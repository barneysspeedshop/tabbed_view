import 'dart:async';

import 'package:flutter/widgets.dart';

import '../tab_data.dart';

/// Called only when a tab close is requested from the user interface,
/// for example when tapping the close button on a tab.
///
/// This interceptor is **not triggered** when tabs are removed programmatically
/// through the [TabbedViewController].
///
/// Return `true` (or a Future resolving to `true`) to allow the tab to be removed,
/// or `false` to cancel the removal.
typedef TabRemoveInterceptor = FutureOr<bool> Function(
    BuildContext context, int tabIndex, TabData tabData);
