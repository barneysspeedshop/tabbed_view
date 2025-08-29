import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../tab_data.dart';
import '../../theme/tabbed_view_theme_data.dart';
import '../../theme/theme_widget.dart';
import '../../typedefs/hidden_tabs_menu_item_builder.dart';
import '../tabbed_view_provider.dart';

/// The menu widget for hidden tabs, displayed in an overlay.
@internal
class HiddenTabsMenuWidget extends StatelessWidget {
  const HiddenTabsMenuWidget({
    super.key,
    required this.provider,
    required this.hiddenTabs,
    required this.onSelection,
    this.reverse = false,
  });

  final TabbedViewProvider provider;
  final List<int> hiddenTabs;
  final void Function(int tabIndex) onSelection;
  final bool reverse;

  @override
  Widget build(BuildContext context) {
    final TabbedViewThemeData theme = TabbedViewTheme.of(context);

    final menuTheme = theme.menu;

    final List<TabData> tabs = provider.controller.tabs;
    final HiddenTabsMenuItemBuilder? menuItemBuilder =
        provider.hiddenTabsMenuItemBuilder;

    return Container(
      constraints: BoxConstraints(maxWidth: menuTheme.maxWidth),
      margin: menuTheme.margin,
      padding: menuTheme.padding,
      decoration: BoxDecoration(
        color: menuTheme.color,
        borderRadius: menuTheme.borderRadius,
        boxShadow: menuTheme.boxShadow,
      ),
      // The clipBehavior is necessary to avoid having the InkWell effects
      // spill outside the rounded corners.
      clipBehavior: Clip.antiAlias,
      child: Material(
        type: MaterialType.transparency,
        child: ListView.builder(
          shrinkWrap: true,
          reverse: reverse,
          itemCount: hiddenTabs.length,
          itemBuilder: (context, i) {
            final int tabIndex = hiddenTabs[i];
            final TabData tab = tabs[tabIndex];
            final Widget child;
            if (menuItemBuilder != null) {
              child = menuItemBuilder(context, tabIndex, tab);
            } else {
              child = Padding(
                padding: menuTheme.menuItemPadding,
                child: Text(
                  tab.text,
                  style: menuTheme.textStyle,
                  overflow: menuTheme.ellipsisOverflowText
                      ? TextOverflow.ellipsis
                      : null,
                ),
              );
            }
            return InkWell(
              onTap: () => onSelection(tabIndex),
              hoverColor: menuTheme.hoverColor,
              highlightColor: menuTheme.highlightColor,
              child: child,
            );
          },
        ),
      ),
    );
  }
}
