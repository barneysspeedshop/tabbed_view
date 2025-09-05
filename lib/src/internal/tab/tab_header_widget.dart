import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../tab_bar_position.dart';
import '../../tab_button.dart';
import '../../tab_data.dart';
import '../../tab_status.dart';
import '../../theme/side_tabs_layout.dart';
import '../../theme/tab_status_theme_data.dart';
import '../../theme/tab_theme_data.dart';
import '../../unselected_tab_buttons_behavior.dart';
import '../flow_layout.dart';
import 'tab_button_widget.dart';
import '../tabbed_view_provider.dart';

@internal
class TabHeaderWidget extends StatelessWidget {
  const TabHeaderWidget(
      {required this.index,
      required this.status,
      required this.provider,
      required this.onClose,
      required this.tabTheme,
      required this.sideTabsLayout});

  final int index;
  final TabStatus status;
  final TabbedViewProvider provider;
  final Function onClose;
  final TabThemeData tabTheme;
  final SideTabsLayout sideTabsLayout;

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
        sideTabsLayout == SideTabsLayout.rotated) {
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

    Color color = statusTheme?.buttonColor ?? tabTheme.buttonColor;
    Color hoverColor =
        statusTheme?.hoveredButtonColor ?? tabTheme.hoveredButtonColor ?? color;
    Color disabledColor =
        statusTheme?.disabledButtonColor ?? tabTheme.disabledButtonColor;

    BoxDecoration? normalBackground =
        statusTheme?.buttonBackground ?? tabTheme.buttonBackground;
    BoxDecoration? hoverBackground = statusTheme?.hoveredButtonBackground ??
        tabTheme.hoveredButtonBackground;
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

    bool hasButtons = tab.buttons != null && tab.buttons!.isNotEmpty;
    EdgeInsets? padding;
    if (tab.closable || hasButtons && tabTheme.buttonsOffset > 0) {
      padding = EdgeInsets.only(
          right: tabTheme.buttonsOffset); // Use final buttonsOffset
    }

    Widget? leading = tab.leading?.call(context, status);
    if (leading != null) {
      textAndButtons.add(leading);
    }
    textAndButtons.add(Container(
        child: Center(
            child: SizedBox(
                width: tab.textSize,
                child: Text(tab.text,
                    style: textStyle, overflow: TextOverflow.ellipsis))),
        padding: padding));

    if (hasButtons) {
      final bool enabled = provider.draggingTabIndex == null &&
          (status == TabStatus.selected ||
              provider.unselectedTabButtonsBehavior ==
                  UnselectedTabButtonsBehavior.allEnabled);

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
                enabled: enabled,
                normalColor: color,
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
      final bool enabled = provider.draggingTabIndex == null &&
          (status == TabStatus.selected ||
              provider.unselectedTabButtonsBehavior !=
                  UnselectedTabButtonsBehavior.allDisabled);

      EdgeInsets? padding;
      if (hasButtons && tabTheme.buttonsGap > 0) {
        padding = EdgeInsets.only(left: tabTheme.buttonsGap);
      }
      TabButton closeButton = TabButton(
          icon: tabTheme.closeIcon,
          onPressed: () async => await _onClose(context, index),
          toolTip: provider.closeButtonTooltip);
      textAndButtons.add(Container(
          child: TabButtonWidget(
              provider: provider,
              button: closeButton,
              enabled: enabled,
              normalColor: color,
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
