import 'package:flutter/material.dart';

import '../tab_button.dart';

/// Tabs area buttons builder
typedef TabsAreaButtonsBuilder = List<TabButton> Function(
    BuildContext context, int tabsCount);
