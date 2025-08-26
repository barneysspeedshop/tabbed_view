import 'package:flutter/material.dart';
import 'package:tabbed_view/src/theme/content_area_theme_data.dart';
import 'package:tabbed_view/src/theme/tabs_area_cross_axis_fit.dart';
import 'package:tabbed_view/src/theme/hidden_tabs_menu_theme_data.dart';
import 'package:tabbed_view/src/theme/tab_theme_data.dart';
import 'package:tabbed_view/src/theme/tabbed_view_theme_data.dart';
import 'package:tabbed_view/src/theme/tabs_area_theme_data.dart';

/// Predefined dark theme builder.
class DarkTheme extends TabbedViewThemeData {
  DarkTheme._();

  factory DarkTheme(
      {required MaterialColor colorSet, required double fontSize}) {
    Color tabColor = colorSet[900]!;
    Color selectedTabColor = colorSet[800]!;
    Color highlightedColor = colorSet[700]!;
    Color normalButtonColor = colorSet[100]!;
    Color disabledButtonColor = colorSet[600]!;
    Color hoverButtonColor = colorSet[100]!;
    Color menuColor = colorSet[700]!; // This is the background for the menu
    Color menuDividerColor = colorSet[500]!;
    Color fontColor = colorSet[100]!;
    Color buttonsAreaColor = colorSet[800]!;

    final DarkTheme theme = DarkTheme._();

    final TabsAreaThemeData tabsArea = theme.tabsArea;
    tabsArea.crossAxisFit = TabsAreaCrossAxisFit.all;
    tabsArea.middleGap = 4;
    tabsArea.buttonsAreaPadding = EdgeInsets.all(2);
    tabsArea.buttonsAreaDecoration = BoxDecoration(color: buttonsAreaColor);
    tabsArea.buttonPadding = const EdgeInsets.all(2);
    tabsArea.hoverButtonBackground = BoxDecoration(color: highlightedColor);
    tabsArea.normalButtonColor = normalButtonColor;
    tabsArea.hoverButtonColor = hoverButtonColor;
    tabsArea.disabledButtonColor = disabledButtonColor;
    tabsArea.dropColor = Color.fromARGB(150, 255, 255, 255);

    final TabThemeData tab = theme.tab;
    double bottomWidth = 3;
    tab.buttonsOffset = 4;
    tab.textStyle = TextStyle(fontSize: fontSize, color: fontColor);
    //decoration: BoxDecoration(color: tabColor),
    tab.draggingDecoration = BoxDecoration(color: tabColor);
    tab.padding = EdgeInsets.fromLTRB(6, 3, 3, 3);
    tab.paddingWithoutButton = EdgeInsets.fromLTRB(6, 3, 6, 3);
    tab.hoverButtonBackground = BoxDecoration(color: highlightedColor);
    tab.buttonPadding = const EdgeInsets.all(2);
    tab.normalButtonColor = normalButtonColor;
    tab.hoverButtonColor = hoverButtonColor;
    tab.disabledButtonColor = disabledButtonColor;

    final ContentAreaThemeData contentArea = theme.contentArea;
    contentArea.color = selectedTabColor;
    contentArea.padding = EdgeInsets.all(8);

    final HiddenTabsMenuThemeData menu = theme.menu;
    menu.borderRadius = BorderRadius.circular(4);

    return theme;
  }
}
