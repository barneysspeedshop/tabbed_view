import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../draggable_config.dart';
import '../draggable_data.dart';
import '../tab_bar_position.dart';
import '../tab_button.dart';
import '../tab_data.dart';
import '../tab_status.dart';
import '../theme/tab_border_builder.dart';
import '../theme/tab_status_theme_data.dart';
import '../theme/tab_theme_data.dart';
import '../theme/tabbed_view_theme_data.dart';
import '../theme/theme_widget.dart';
import '../theme/side_tabs_layout.dart';
import 'flow_layout.dart';
import 'tab_button_widget.dart';
import 'tabbed_view_provider.dart';
import 'tabs_area/drop_tab_widget.dart';
import 'tabs_area/tab_drag_feedback_widget.dart';

/// Listener for the tabs with the mouse over.
@internal
typedef UpdateHoveredIndex = void Function(int? tabIndex);

/// The tab widget. Displays the tab text and its buttons.
@internal
class TabWidget extends StatelessWidget {
  const TabWidget(
      {required UniqueKey key,
      required this.index,
      required this.status,
      required this.provider,
      required this.updateHoveredIndex,
      required this.onClose})
      : super(key: key);

  final int index;
  final TabStatus status;
  final TabbedViewProvider provider;
  final UpdateHoveredIndex updateHoveredIndex;
  final Function onClose;

  @override
  Widget build(BuildContext context) {
    final TabData tab = provider.controller.tabs[index];
    final TabbedViewThemeData theme = TabbedViewTheme.of(context);
    final TabThemeData tabTheme = theme.tab;
    final TabStatusThemeData? statusTabTheme = theme.tab.getTabThemeFor(status);

    Widget widget = _TabContentWidget(
        provider: provider,
        index: index,
        onClose: onClose,
        status: status,
        tabTheme: tabTheme);

    Color? color = statusTabTheme?.color ?? tabTheme.color;
    if (color != null) {
      widget = Container(color: color, child: widget);
    }

    TabBorderBuilder? borderBuilder = tabTheme.borderBuilder;
    while (borderBuilder != null) {
      TabBorder tabBorder = borderBuilder(
          status: status, tabBarPosition: provider.tabBarPosition);
      if (tabBorder.border != null) {
        final BorderRadius? borderRadius = tabBorder.borderRadius;
        if (borderRadius != null) {
          widget = ClipRRect(
              borderRadius: borderRadius,
              child: Container(
                  decoration: BoxDecoration(
                      border: tabBorder.border, borderRadius: borderRadius),
                  child: widget));
        } else {
          widget = Container(
              decoration: BoxDecoration(border: tabBorder.border),
              child: widget);
        }
      }
      borderBuilder = tabBorder.wrapperBorderBuilder;
    }

    final maxWidth = tabTheme.maxMainSize;
    if (maxWidth != null) {
      BoxConstraints constraints;
      if (provider.tabBarPosition.isHorizontal) {
        constraints = BoxConstraints(maxWidth: maxWidth);
      } else {
        // left or right
        constraints = BoxConstraints(maxHeight: maxWidth);
      }
      widget = ConstrainedBox(
        constraints: constraints,
        child: widget,
      );
    }

    MouseCursor cursor = MouseCursor.defer;
    if (provider.draggingTabIndex == null && status == TabStatus.selected) {
      cursor = SystemMouseCursors.click;
    }

    final Widget interactiveTab = widget;

    widget = MouseRegion(
        cursor: cursor,
        onEnter: (event) => updateHoveredIndex(index),
        onExit: (event) => updateHoveredIndex(null),
        child: provider.draggingTabIndex == null
            ? GestureDetector(
                onTap: () => _onSelect(context, index),
                onSecondaryTapDown: (details) {
                  if (provider.onTabSecondaryTap != null) {
                    TabData tab = provider.controller.tabs[index];
                    provider.onTabSecondaryTap!(index, tab, details);
                  }
                },
                child: interactiveTab)
            : interactiveTab);

    if (tab.draggable) {
      DraggableConfig draggableConfig = DraggableConfig.defaultConfig;
      if (provider.onDraggableBuild != null) {
        draggableConfig =
            provider.onDraggableBuild!(provider.controller, index, tab);
      }

      if (draggableConfig.canDrag) {
        Widget feedback = draggableConfig.feedback != null
            ? draggableConfig.feedback!
            : TabDragFeedbackWidget(tab: tab, tabTheme: tabTheme);

        widget = Draggable<DraggableData>(
            child: widget,
            feedback: Material(child: feedback),
            data: DraggableData(provider.controller, tab, provider.dragScope),
            feedbackOffset: draggableConfig.feedbackOffset,
            dragAnchorStrategy: draggableConfig.dragAnchorStrategy,
            onDragStarted: () {
              provider.onTabDrag(index);
              if (draggableConfig.onDragStarted != null) {
                draggableConfig.onDragStarted!();
              }
            },
            onDragUpdate: (details) {
              if (draggableConfig.onDragUpdate != null) {
                draggableConfig.onDragUpdate!(details);
              }
            },
            onDraggableCanceled: (velocity, offset) {
              provider.onTabDrag(null);
              if (draggableConfig.onDraggableCanceled != null) {
                draggableConfig.onDraggableCanceled!(velocity, offset);
              }
            },
            onDragEnd: (details) {
              if (draggableConfig.onDragEnd != null) {
                draggableConfig.onDragEnd!(details);
              }
            },
            onDragCompleted: () {
              provider.onTabDrag(null);
              if (draggableConfig.onDragCompleted != null) {
                draggableConfig.onDragCompleted!();
              }
            });

        widget = Opacity(
            child: widget,
            opacity: provider.draggingTabIndex != index
                ? 1
                : tabTheme.draggingOpacity);
      }
    }

    if (provider.tabReorderEnabled &&
        provider.draggingTabIndex != TabDataHelper.indexFrom(tab)) {
      return DropTabWidget(
          provider: provider,
          newIndex: TabDataHelper.indexFrom(tab),
          child: widget,
          halfWidthDrop: true);
    }
    return widget;
  }

  void _onSelect(BuildContext context, int newTabIndex) {
    if (provider.tabSelectInterceptor == null ||
        provider.tabSelectInterceptor!(newTabIndex)) {
      provider.controller.selectedIndex = newTabIndex;
    }
  }
}

class _TabContentWidget extends StatelessWidget {
  const _TabContentWidget(
      {required this.index,
      required this.status,
      required this.provider,
      required this.onClose,
      required this.tabTheme});

  final int index;
  final TabStatus status;
  final TabbedViewProvider provider;
  final Function onClose;
  final TabThemeData tabTheme;

  @override
  Widget build(BuildContext context) {
    List<Widget> textAndButtons = _textAndButtons(context, tabTheme);

    Widget textAndButtonsContainer = ClipRect(
        child: FlowLayout(
            children: textAndButtons,
            firstChildFlex: true,
            verticalAlignment: tabTheme.verticalAlignment));

    final TabStatusThemeData? statusTheme = tabTheme.getTabThemeFor(status);

    EdgeInsetsGeometry? padding;
    if (textAndButtons.length == 1) {
      padding =
          statusTheme?.paddingWithoutButton ?? tabTheme.paddingWithoutButton;
    }
    if (padding == null) {
      padding = statusTheme?.padding ?? tabTheme.padding;
    }

    Widget widget = Container(
      child: Container(child: textAndButtonsContainer, padding: padding),
    );

    if (provider.tabBarPosition.isVertical &&
        tabTheme.sideTabsLayout == SideTabsLayout.rotated) {
      // Rotate the tab content
      if (provider.tabBarPosition == TabBarPosition.left) {
        widget = RotatedBox(quarterTurns: -1, child: widget);
      } else if (provider.tabBarPosition == TabBarPosition.right) {
        widget = RotatedBox(quarterTurns: 1, child: widget);
      }
    }

    return widget;
  }

  /// Builds a list with title text and buttons.
  List<Widget> _textAndButtons(BuildContext context, TabThemeData tabTheme) {
    List<Widget> textAndButtons = [];

    TabData tab = provider.controller.tabs[index];
    TabStatusThemeData? statusTheme = tabTheme.getTabThemeFor(status);

    Color normalColor =
        statusTheme?.normalButtonColor ?? tabTheme.normalButtonColor;
    Color hoverColor =
        statusTheme?.hoverButtonColor ?? tabTheme.hoverButtonColor;
    Color disabledColor =
        statusTheme?.disabledButtonColor ?? tabTheme.disabledButtonColor;

    BoxDecoration? normalBackground =
        statusTheme?.normalButtonBackground ?? tabTheme.normalButtonBackground;
    BoxDecoration? hoverBackground =
        statusTheme?.hoverButtonBackground ?? tabTheme.hoverButtonBackground;
    BoxDecoration? disabledBackground = statusTheme?.disabledButtonBackground ??
        tabTheme.disabledButtonBackground;

    TextStyle? textStyle = tabTheme.textStyle;
    if (statusTheme?.fontColor != null) {
      if (textStyle != null) {
        textStyle = textStyle.copyWith(color: statusTheme?.fontColor);
      } else {
        textStyle = TextStyle(color: statusTheme?.fontColor);
      }
    }

    final bool buttonsEnabled = provider.draggingTabIndex == null &&
        (provider.selectToEnableButtons == false ||
            (provider.selectToEnableButtons && status == TabStatus.selected));
    bool hasButtons = tab.buttons != null && tab.buttons!.isNotEmpty;
    EdgeInsets? padding;
    if (tab.closable || hasButtons && tabTheme.buttonsOffset > 0) {
      padding = EdgeInsets.only(
          right: tabTheme.buttonsOffset); // Use final buttonsOffset
    }

    if (tab.leading != null) {
      Widget? leading = tab.leading!(context, status);
      if (leading != null) {
        textAndButtons.add(leading);
      }
    }
    textAndButtons.add(Container(
        child: SizedBox(
            width: tab.textSize,
            child: Text(tab.text,
                style: textStyle, overflow: TextOverflow.ellipsis)),
        padding: padding));

    if (hasButtons) {
      for (int i = 0; i < tab.buttons!.length; i++) {
        EdgeInsets? padding;
        if (i > 0 && i < tab.buttons!.length && tabTheme.buttonsGap > 0) {
          // Use final buttonsGap
          padding = EdgeInsets.only(left: tabTheme.buttonsGap);
        }
        TabButton button = tab.buttons![i];
        textAndButtons.add(Container(
            child: TabButtonWidget(
                provider: provider,
                button: button,
                enabled: buttonsEnabled,
                normalColor: normalColor,
                hoverColor: hoverColor,
                disabledColor: disabledColor,
                normalBackground: normalBackground,
                hoverBackground: hoverBackground,
                disabledBackground: disabledBackground,
                iconSize: button.iconSize != null
                    ? button.iconSize!
                    : tabTheme.buttonIconSize,
                themePadding: tabTheme.buttonPadding),
            padding: padding));
      }
    }
    if (tab.closable) {
      EdgeInsets? padding;
      if (hasButtons && tabTheme.buttonsGap > 0) {
        padding = EdgeInsets.only(left: tabTheme.buttonsGap);
      }
      TabButton closeButton = TabButton(
          icon: tabTheme.closeIcon,
          onPressed: () async => await _onClose(context, index),
          toolTip: provider.closeButtonTooltip);

      bool enabled = buttonsEnabled;
      if (tabTheme.showCloseIconWhenNotFocused) {
        enabled = provider.draggingTabIndex == null;
      }

      textAndButtons.add(Container(
          child: TabButtonWidget(
              provider: provider,
              button: closeButton,
              enabled: enabled,
              normalColor: normalColor,
              hoverColor: hoverColor,
              disabledColor: disabledColor,
              normalBackground: normalBackground,
              hoverBackground: hoverBackground,
              disabledBackground: disabledBackground,
              iconSize: tabTheme.buttonIconSize,
              themePadding: tabTheme.buttonPadding),
          padding: padding));
    }

    return textAndButtons;
  }

  Future<void> _onClose(BuildContext context, int index) async {
    TabData tabData = provider.controller.getTabByIndex(index);
    if (provider.tabCloseInterceptor == null ||
        (await provider.tabCloseInterceptor!(index, tabData))) {
      onClose();
      index = provider.controller.tabs.indexOf(tabData);
      index != -1 ? provider.controller.removeTab(index) : null;
      if (provider.onTabClose != null && index != -1) {
        provider.onTabClose!(index, tabData);
      }
    }
  }
}
