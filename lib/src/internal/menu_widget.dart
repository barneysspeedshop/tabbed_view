import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../tabbed_view_menu_builder.dart';
import '../tabbed_view_menu_item.dart';
import '../theme/tabbed_view_menu_theme_data.dart';
import '../theme/tabbed_view_theme_data.dart';
import '../theme/theme_widget.dart';

@internal
class MenuWidget extends StatefulWidget {
  const MenuWidget({super.key, required this.menuBuilder, required this.child});

  final TabbedViewMenuBuilder menuBuilder;
  final Widget child;

  @override
  State<StatefulWidget> createState() => MenuWidgetState();
}

class MenuWidgetState extends State<MenuWidget> {
  // List used to create menus only on click.
  // This is important because in the case of hidden tabs,
  // the actual list will only exist after the final rebuild.
  // Therefore, it would not be possible to instantiate
  // the MenuAnchor in advance with the menus.
  final List<TabbedViewMenuItem> _lazyItemList = [];

  @override
  Widget build(BuildContext context) {
    final TabbedViewThemeData theme = TabbedViewTheme.of(context);
    final TabbedViewMenuThemeData menuTheme = theme.menu;

    return MenuAnchor(
        child: widget.child,
        style: menuTheme.style,
        onClose: () => _lazyItemList.clear(),
        builder:
            (BuildContext context, MenuController controller, Widget? child) {
          return GestureDetector(
              child: child, onTap: () => _onTap(context, controller));
        },
        menuChildren: [_menuItemList(context: context, menuTheme: menuTheme)]);
  }

  void _onTap(BuildContext context, MenuController controller) {
    // Lazy construction of menus.
    setState(() {
      _lazyItemList.addAll(widget.menuBuilder(context));
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        if (controller.isOpen) {
          controller.close();
        } else {
          controller.open();
        }
      }
    });
  }

  Widget _menuItemList(
      {required BuildContext context,
      required TabbedViewMenuThemeData menuTheme}) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: menuTheme.maxWidth ?? double.infinity,
        maxHeight: menuTheme.maxHeight ?? double.infinity,
      ),
      child: SingleChildScrollView(
        padding: menuTheme.padding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            _lazyItemList.length,
            (i) => _menuItem(
                context: context, menuTheme: menuTheme, item: _lazyItemList[i]),
          ),
        ),
      ),
    );
  }

  Widget _menuItem(
      {required BuildContext context,
      required TabbedViewMenuThemeData menuTheme,
      required TabbedViewMenuItem item}) {
    return MenuItemButton(
        style: menuTheme.menuItemStyle,
        onPressed: item.onSelection,
        child: Text(
          item.text,
          style: menuTheme.textStyle,
          overflow:
              menuTheme.ellipsisOverflowText ? TextOverflow.ellipsis : null,
        ));
  }
}
