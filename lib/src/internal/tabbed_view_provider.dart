import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

import '../tab_bar_position.dart';
import '../tabbed_view_controller.dart';
import '../tabbed_view_menu_item.dart';
import '../typedefs/can_drop.dart';
import '../typedefs/hidden_tabs_menu_item_builder.dart';
import '../typedefs/on_before_drop_accept.dart';
import '../typedefs/on_draggable_build.dart';
import '../typedefs/on_tab_close.dart';
import '../typedefs/on_tab_reorder.dart';
import '../typedefs/on_tab_secondary_tap.dart';
import '../typedefs/tab_close_interceptor.dart';
import '../typedefs/tab_select_interceptor.dart';
import '../typedefs/tabs_area_buttons_builder.dart';
import '../unselected_tab_buttons_behavior.dart';

/// Propagates parameters to internal widgets.
@internal
class TabbedViewProvider {
  TabbedViewProvider(
      {required this.controller,
      this.contentBuilder,
      required this.tabReorderEnabled,
      this.onTabReorder,
      this.onTabClose,
      this.tabCloseInterceptor,
      required this.contentClip,
      this.tabSelectInterceptor,
      required this.unselectedTabButtonsBehavior,
      this.closeButtonTooltip,
      this.tabsAreaButtonsBuilder,
      this.onTabSecondaryTap,
      required this.menuItems,
      required this.menuItemsUpdater,
      required this.onTabDrag,
      required this.draggingTabIndex,
      required this.onDraggableBuild,
      required this.canDrop,
      required this.onBeforeDropAccept,
      required this.dragScope,
      required this.tabBarPosition,
      this.hiddenTabsMenuItemBuilder,
      this.trailing});

  final TabbedViewController controller;
  final bool contentClip;
  final IndexedWidgetBuilder? contentBuilder;
  final bool tabReorderEnabled;
  final OnTabReorder? onTabReorder;
  final OnTabClose? onTabClose;
  final TabCloseInterceptor? tabCloseInterceptor;
  final TabSelectInterceptor? tabSelectInterceptor;
  final OnTabSecondaryTap? onTabSecondaryTap;
  final UnselectedTabButtonsBehavior unselectedTabButtonsBehavior;
  final String? closeButtonTooltip;
  final TabsAreaButtonsBuilder? tabsAreaButtonsBuilder;
  final List<TabbedViewMenuItem> menuItems;
  final MenuItemsUpdater menuItemsUpdater;
  final OnTabDrag onTabDrag;
  final int? draggingTabIndex;
  final OnDraggableBuild? onDraggableBuild;
  final CanDrop? canDrop;
  final OnBeforeDropAccept? onBeforeDropAccept;
  final String? dragScope;
  final TabBarPosition tabBarPosition;
  final HiddenTabsMenuItemBuilder? hiddenTabsMenuItemBuilder;
  final Widget? trailing;
}

/// Updater for menu items
typedef MenuItemsUpdater = void Function(List<TabbedViewMenuItem>);

/// Event that will be triggered when the tab drag start or end.
typedef OnTabDrag = Function(int? tabIndex);
