import 'package:flutter/material.dart';

import 'content_area_theme_data.dart';
import 'default_themes/classic_theme.dart';
import 'default_themes/minimalist_theme.dart';
import 'default_themes/underline_theme.dart';
import 'hidden_tabs_menu_theme_data.dart';
import 'tab_status_theme_data.dart';
import 'tab_theme_data.dart';
import 'tabs_area_theme_data.dart';

/// The [TabbedView] theme.
/// Defines the configuration of the overall visual [Theme] for a widget subtree within the app.
class TabbedViewThemeData {
  TabbedViewThemeData(
      {TabsAreaThemeData? tabsArea,
      TabThemeData? tab,
      ContentAreaThemeData? contentArea,
      HiddenTabsMenuThemeData? menu})
      : tab = tab ??
            TabThemeData(
                selectedStatus: TabStatusThemeData(),
                hoveredStatus: TabStatusThemeData()),
        tabsArea = tabsArea ?? TabsAreaThemeData(),
        contentArea = contentArea ?? ContentAreaThemeData(),
        menu = menu ?? HiddenTabsMenuThemeData();

  TabsAreaThemeData tabsArea;
  TabThemeData tab;
  ContentAreaThemeData contentArea;
  HiddenTabsMenuThemeData menu;

  /// The border that separates the content area from the tab bar.
  ///
  /// If [isDividerWithinTabArea] is set to `true`, this border is drawn **inside**
  /// the tab area, touching the sides of the tabs but not extending underneath them.
  ///
  /// If `false`, the border is drawn **outside** the tab area and acts like a
  /// standard border, extending fully across the width of the pane.
  BorderSide? divider;

  /// If `true`, the [divider] will be drawn within the bounds of the tab area.
  /// If `false`, the divider will act as a standard border, drawn outside the tab area.
  bool isDividerWithinTabArea = false;

  /// Builds the predefined classic theme.
  factory TabbedViewThemeData.classic(
      {Brightness brightness = Brightness.light,
      MaterialColor colorSet = Colors.grey,
      double fontSize = 13,
      Color? borderColor,
      double? tabBorderRadius}) {
    return ClassicTheme(
        brightness: brightness,
        colorSet: colorSet,
        fontSize: fontSize,
        borderColor: borderColor,
        tabRadius: tabBorderRadius);
  }

  /// Builds the predefined underline theme.
  factory TabbedViewThemeData.underline(
      {Brightness brightness = Brightness.light,
      MaterialColor colorSet = Colors.grey,
      MaterialColor underlineColorSet = Colors.blue,
      double fontSize = 13}) {
    return UnderlineTheme(
        brightness: brightness,
        colorSet: colorSet,
        underlineColorSet: underlineColorSet,
        fontSize: fontSize);
  }

  /// Builds the predefined minimalist theme.
  factory TabbedViewThemeData.minimalist(
      {Brightness brightness = Brightness.light,
      MaterialColor colorSet = Colors.grey,
      double fontSize = 13,
      double initialGap = 16,
      double gap = 4,
      double? tabRadius = 10}) {
    return MinimalistTheme(
        brightness: brightness,
        colorSet: colorSet,
        fontSize: fontSize,
        initialGap: initialGap,
        gap: gap,
        tabRadius: tabRadius);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TabbedViewThemeData &&
          runtimeType == other.runtimeType &&
          tabsArea == other.tabsArea &&
          tab == other.tab &&
          contentArea == other.contentArea &&
          menu == other.menu;

  @override
  int get hashCode =>
      tabsArea.hashCode ^ tab.hashCode ^ contentArea.hashCode ^ menu.hashCode;
}
