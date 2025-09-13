import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../tab_button.dart';
import '../../tabbed_view_menu_item.dart';
import '../../theme/tabbed_view_theme_data.dart';
import '../../theme/theme_widget.dart';
import '../menu_widget.dart';

/// Widget for tab buttons. Used for any tab button such as the close button.
@internal
class TabButtonWidget extends StatefulWidget {
  TabButtonWidget(
      {required this.button,
      required this.enabled,
      required this.iconSize,
      required this.normalColor,
      required this.hoverColor,
      required this.disabledColor,
      this.themePadding,
      this.normalBackground,
      this.hoverBackground,
      this.disabledBackground});

  final TabButton button;
  final double iconSize;
  final Color normalColor;
  final Color hoverColor;
  final Color disabledColor;
  final EdgeInsetsGeometry? themePadding;
  final bool enabled;
  final BoxDecoration? normalBackground;
  final BoxDecoration? hoverBackground;
  final BoxDecoration? disabledBackground;

  @override
  State<StatefulWidget> createState() => TabButtonWidgetState();
}

/// The [TabButtonWidget] state.
class TabButtonWidgetState extends State<TabButtonWidget> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final TabbedViewThemeData theme = TabbedViewTheme.of(context);

    Color color;
    BoxDecoration? background;

    final bool hasEvent =
        widget.button.onPressed != null || widget.button.menuBuilder != null;
    final bool isDisabled = hasEvent == false || widget.enabled == false;
    if (isDisabled) {
      color = widget.button.disabledColor != null
          ? widget.button.disabledColor!
          : widget.disabledColor;
      background = widget.button.disabledBackground != null
          ? widget.button.disabledBackground
          : widget.disabledBackground;
    } else if (_hover) {
      color = widget.button.hoverColor != null
          ? widget.button.hoverColor!
          : widget.hoverColor;
      background = widget.button.hoverBackground != null
          ? widget.button.hoverBackground
          : widget.hoverBackground;
    } else {
      color = widget.button.color != null
          ? widget.button.color!
          : widget.normalColor;
      background = widget.button.background != null
          ? widget.button.background
          : widget.normalBackground;
    }

    final List<TabbedViewMenuItem>? menuItems =
        widget.button.menuBuilder?.call(context);
    Widget icon;
    if (menuItems != null) {
      icon = theme.menu.menuIcon.buildIcon(color, widget.iconSize);
    } else {
      icon = widget.button.icon!.buildIcon(color, widget.iconSize);
    }

    EdgeInsetsGeometry? padding = widget.button.padding != null
        ? widget.button.padding
        : widget.themePadding;
    if (padding != null || background != null) {
      icon = Container(child: icon, padding: padding, decoration: background);
    }

    if (isDisabled) {
      return icon;
    }

    if (menuItems != null) {
      icon = MenuWidget(
          child: icon,
          itemCount: menuItems.length,
          tabIndexProvider: (index) => index,
          textProvider: (index) => menuItems[index].text,
          callbackBuilder: (context, index) => menuItems[index].onSelection);
    } else {
      icon = GestureDetector(child: icon, onTap: widget.button.onPressed);
    }

    if (widget.button.toolTip != null) {
      icon = Tooltip(
          message: widget.button.toolTip,
          child: icon,
          waitDuration: Duration(milliseconds: 500));
    }

    return MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: _onEnter,
        onExit: _onExit,
        child: icon);
  }

  void _onEnter(PointerEnterEvent event) {
    setState(() {
      _hover = true;
    });
  }

  void _onExit(PointerExitEvent event) {
    setState(() {
      _hover = false;
    });
  }
}
