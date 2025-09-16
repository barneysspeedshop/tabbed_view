import 'package:flutter/gestures.dart';

import '../tab_data.dart';

/// The on tab secondary tap callback function.
///
/// The `details` argument is the `TapDownDetails` of the event, which includes
/// the position of the tap.
typedef OnTabSecondaryTap = void Function(
    int tabIndex, TabData tabData, TapDownDetails details);
