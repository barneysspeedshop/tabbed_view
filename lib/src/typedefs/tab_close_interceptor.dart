import 'dart:async';

import '../tab_data.dart';

/// Intercepts a close event to indicates whether the tab can be closed.
typedef TabCloseInterceptor = FutureOr<bool> Function(
    int tabIndex, TabData tabData);
