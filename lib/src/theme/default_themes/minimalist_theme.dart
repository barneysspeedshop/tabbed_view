import 'package:flutter/material.dart';

import '../content_area_theme_data.dart';
import '../hidden_tabs_menu_theme_data.dart';
import '../tab_theme_data.dart';
import '../tabbed_view_theme_data.dart';
import '../tabs_area_cross_axis_fit.dart';
import '../tabs_area_theme_data.dart';

/// Predefined minimalist theme builder.
class MinimalistTheme extends TabbedViewThemeData {
  MinimalistTheme._();

  factory MinimalistTheme({required MaterialColor colorSet}) {
    final MinimalistTheme theme = MinimalistTheme._();

    final BorderSide borderSide = BorderSide(width: 1, color: colorSet[900]!);
    theme.divider = borderSide;

    final TabsAreaThemeData tabsArea = theme.tabsArea;
    tabsArea.buttonsAreaDecoration = BoxDecoration(color: colorSet[50]!);
    tabsArea.normalButtonColor = colorSet[700]!;
    tabsArea.hoverButtonColor = colorSet[700]!;
    tabsArea.disabledButtonColor = colorSet[300]!;
    tabsArea.buttonsAreaPadding = EdgeInsets.all(2);
    tabsArea.buttonPadding = const EdgeInsets.all(2);
    tabsArea.hoverButtonBackground = BoxDecoration(color: colorSet[300]!);
    tabsArea.crossAxisFit = TabsAreaCrossAxisFit.all;

    final TabThemeData tab = theme.tab;
    tab.color = colorSet[50]!;
    tab.buttonsOffset = 4;
    tab.textStyle = TextStyle(color: colorSet[900]!, fontSize: 13);
    tab.padding = EdgeInsets.fromLTRB(6, 3, 3, 3);
    tab.paddingWithoutButton = EdgeInsets.fromLTRB(6, 3, 6, 3);
    tab.draggingDecoration = BoxDecoration(color: colorSet[50]!);
    tab.normalButtonColor = colorSet[900]!;
    tab.hoverButtonColor = colorSet[900]!;
    tab.disabledButtonColor = colorSet[400]!;
    tab.buttonPadding = const EdgeInsets.all(2);
    tab.hoverButtonBackground = BoxDecoration(color: colorSet[300]!);
    tab.hoveredStatus.color = colorSet[100]!;
    tab.selectedStatus.color = colorSet[600]!;
    tab.selectedStatus.fontColor = colorSet[50]!;
    tab.selectedStatus.normalButtonColor=colorSet[50]!;

    final ContentAreaThemeData contentArea = theme.contentArea;
    contentArea.color = colorSet[50]!;
    contentArea.border = borderSide;

    final HiddenTabsMenuThemeData menu = theme.menu;
    menu.borderRadius = BorderRadius.circular(4);

    return theme;
  }
}
