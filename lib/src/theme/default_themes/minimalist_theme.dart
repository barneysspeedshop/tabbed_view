import 'package:flutter/material.dart';
import 'package:tabbed_view/src/theme/content_area_theme_data.dart';
import 'package:tabbed_view/src/theme/tabs_area_cross_axis_fit.dart';
import 'package:tabbed_view/src/theme/hidden_tabs_menu_theme_data.dart';
import 'package:tabbed_view/src/theme/tab_status_theme_data.dart';
import 'package:tabbed_view/src/theme/tab_theme_data.dart';
import 'package:tabbed_view/src/theme/tabbed_view_theme_data.dart';
import 'package:tabbed_view/src/theme/tabs_area_theme_data.dart';

/// Predefined minimalist theme builder.
class MinimalistTheme extends TabbedViewThemeData {
  MinimalistTheme._();

  factory MinimalistTheme({required MaterialColor colorSet}) {
    final MinimalistTheme theme = MinimalistTheme._();

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
    tab.buttonsOffset = 4;
    tab.textStyle = TextStyle(color: colorSet[900]!, fontSize: 13);
    tab.padding = EdgeInsets.fromLTRB(6, 3, 3, 3);
    tab.paddingWithoutButton = EdgeInsets.fromLTRB(6, 3, 6, 3);
    //decoration: BoxDecoration(color: colorSet[50]!),
    tab.draggingDecoration = BoxDecoration(color: colorSet[50]!);
    tab.normalButtonColor = colorSet[900]!;
    tab.hoverButtonColor = colorSet[900]!;
    tab.disabledButtonColor = colorSet[400]!;
    tab.buttonPadding = const EdgeInsets.all(2);
    tab.hoverButtonBackground = BoxDecoration(color: colorSet[300]!);
    //highlightedStatus: TabStatusThemeData(border: BorderSide(color: colorSet[300]!, width: 1)),
    //selectedStatus: TabStatusThemeData(border: BorderSide(color: colorSet[700]!, width: 1)));

    final ContentAreaThemeData contentArea = theme.contentArea;
    BorderSide borderSide = BorderSide(width: 1, color: colorSet[900]!);
    contentArea.color = colorSet[50]!;
    contentArea.border = borderSide;

    final HiddenTabsMenuThemeData menu = theme.menu;
    menu.textStyle = TextStyle(color: colorSet[900]!, fontSize: 13);
    menu.color = colorSet[50]!;
    menu.menuItemPadding =
        const EdgeInsets.symmetric(horizontal: 12, vertical: 8);
    menu.boxShadow = [
      BoxShadow(
          color: colorSet[900]!.withAlpha(100),
          blurRadius: 4,
          offset: const Offset(0, 2))
    ];
    menu.borderRadius = BorderRadius.circular(4);

    return theme;
  }
}
