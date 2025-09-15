import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../tab_bar_position.dart';
import '../tab_data.dart';
import '../tabbed_view_controller.dart';
import '../theme/tabbed_view_theme_data.dart';
import '../theme/theme_widget.dart';
import 'tabbed_view_provider.dart';

/// Container widget for the tab content and menu.
@internal
class ContentArea extends StatelessWidget {
  ContentArea({required this.tabsAreaVisible, required this.provider});

  final bool tabsAreaVisible;
  final TabbedViewProvider provider;

  @override
  Widget build(BuildContext context) {
    TabbedViewController controller = provider.controller;
    TabbedViewThemeData theme = TabbedViewTheme.of(context);

    LayoutBuilder layoutBuilder = LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      List<Widget> children = [];

      for (int i = 0; i < controller.tabs.length; i++) {
        TabData tab = controller.tabs[i];
        bool selectedTab =
            controller.selectedIndex != null && i == controller.selectedIndex;
        if (tab.keepAlive || selectedTab) {
          Widget? child;
          if (provider.contentBuilder != null) {
            child = provider.contentBuilder!(context, i);
          } else {
            child = tab.content;
          }
          if (child != null) {
            child = ExcludeFocus(excluding: !selectedTab, child: child);
          }
          if (tab.keepAlive) {
            child = Offstage(offstage: !selectedTab, child: child);
          }
          // Padding will be applied once on the parent container.
          children.add(
              Positioned.fill(key: tab.key, child: Container(child: child)));
        }
      }

      Widget listener = NotificationListener<SizeChangedLayoutNotification>(
          child: SizeChangedLayoutNotifier(child: Stack(children: children)));

      final Border border = _buildBorder(theme: theme);
      final BorderRadius borderRadius = _buildBorderRadius(theme: theme);

      BoxDecoration decoration = BoxDecoration(
          color: theme.contentArea.color,
          borderRadius: borderRadius,
          border: border);
      return Container(
          child: listener,
          decoration: decoration,
          padding: theme.contentArea.padding);
    });
    if (provider.contentClip) {
      return ClipRect(child: layoutBuilder);
    }

    return layoutBuilder;
  }

  BorderRadius _buildBorderRadius({required TabbedViewThemeData theme}) {
    final Radius radius = Radius.circular(theme.contentArea.borderRadius);
    final TabBarPosition position = theme.tabsArea.position;

    bool top = position != TabBarPosition.top;
    bool bottom = position != TabBarPosition.bottom;
    bool left = position != TabBarPosition.left;
    bool right = position != TabBarPosition.right;

    return BorderRadius.only(
      topLeft: (left && top) ? radius : Radius.zero,
      topRight: (right && top) ? radius : Radius.zero,
      bottomLeft: (left && bottom) ? radius : Radius.zero,
      bottomRight: (right && bottom) ? radius : Radius.zero,
    );
  }

  Border _buildBorder({required TabbedViewThemeData theme}) {
    final bool needDividerBorderSide = !theme.isDividerWithinTabArea &&
        ((provider.controller.length == 0 && theme.alwaysShowDivider) ||
            (provider.controller.length > 0));
    final BorderSide divider = needDividerBorderSide
        ? theme.divider ?? BorderSide.none
        : BorderSide.none;
    final BorderSide borderSide = theme.contentArea.border ?? BorderSide.none;
    final TabBarPosition position = theme.tabsArea.position;

    bool top = position != TabBarPosition.top;
    bool bottom = position != TabBarPosition.bottom;
    bool left = position != TabBarPosition.left;
    bool right = position != TabBarPosition.right;

    return Border(
      top: top ? borderSide : divider,
      bottom: bottom ? borderSide : divider,
      left: left ? borderSide : divider,
      right: right ? borderSide : divider,
    );
  }
}
