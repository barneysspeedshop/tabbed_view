import 'package:flutter/material.dart';

import '../tab_data.dart';

/// Builder for hidden tabs menu item.
typedef HiddenTabsMenuItemBuilder = Widget Function(
    BuildContext context, int tabIndex, TabData tabData);
