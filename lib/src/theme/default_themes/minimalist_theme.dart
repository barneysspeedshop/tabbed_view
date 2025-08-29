import 'package:flutter/material.dart';

import '../hidden_tabs_menu_theme_data.dart';
import '../tab_theme_data.dart';
import '../tabbed_view_theme_data.dart';
import '../tabs_area_theme_data.dart';

/// Predefined minimalist theme builder.
class MinimalistTheme extends TabbedViewThemeData {
  MinimalistTheme._();

  factory MinimalistTheme(
      {required Brightness brightness,
      required MaterialColor colorSet,
      required double fontSize,
      double gap = 4}) {
    final bool isLight = brightness == Brightness.light;

    final Color background = isLight ? colorSet[400]! : colorSet[800]!;
    final Color hoveredColor = isLight ? colorSet[200]! : colorSet[700]!;
    final Color normalButtonColor = isLight ? colorSet[800]! : colorSet[100]!;
    final Color disabledButtonColor = isLight ? colorSet[400]! : colorSet[600]!;
    final Color hoverButtonColor = isLight ? colorSet[800]! : colorSet[100]!;
    final Color fontColor = isLight ? colorSet[800]! : colorSet[100]!;

    final MinimalistTheme theme = MinimalistTheme._();

    theme.divider =
        BorderSide(color: isLight ? colorSet[700]! : colorSet[700]!, width: 4);

    final TabsAreaThemeData tabsArea = theme.tabsArea;
    tabsArea.middleGap = gap;
    tabsArea.buttonsAreaPadding = EdgeInsets.all(4);
    tabsArea.buttonPadding = const EdgeInsets.all(4);
    tabsArea.hoverButtonBackground = BoxDecoration(color: hoveredColor);
    tabsArea.normalButtonColor = normalButtonColor;
    tabsArea.hoverButtonColor = hoverButtonColor;
    tabsArea.disabledButtonColor = disabledButtonColor;
    tabsArea.dropColor = Color.fromARGB(150, 255, 255, 255);
    final TabThemeData tab = theme.tab;
    tab.buttonsOffset = 4;
    tab.textStyle = TextStyle(fontSize: fontSize, color: fontColor);
    tab.draggingDecoration = BoxDecoration(color: background);
    tab.padding = EdgeInsets.fromLTRB(8, 4, 4, 4);
    tab.paddingWithoutButton = EdgeInsets.fromLTRB(8, 4, 8, 4);
    tab.hoverButtonBackground = BoxDecoration(color: hoveredColor);
    tab.buttonPadding = const EdgeInsets.all(4);
    tab.normalButtonColor = normalButtonColor;
    tab.hoverButtonColor = hoverButtonColor;
    tab.disabledButtonColor = disabledButtonColor;
    tab.selectedStatus.color = background;
    tab.hoveredStatus.color = hoveredColor;

    final HiddenTabsMenuThemeData menu =
        HiddenTabsMenuThemeData(brightness: brightness);
    theme.menu = menu;
    menu.borderRadius = BorderRadius.circular(4);

    return theme;
  }
}
