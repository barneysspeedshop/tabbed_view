import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../theme/tabbed_view_menu_theme_data.dart';
import '../theme/tabbed_view_theme_data.dart';
import '../theme/theme_widget.dart';

typedef IndexedTextProvider = String Function(int index);
typedef IndexedTabIndexProvider = int Function(int index);
typedef NullableIndexedCallbackBuilder = VoidCallback? Function(
    BuildContext context, int index);

@internal
class MenuWidget extends StatelessWidget {
  const MenuWidget(
      {super.key,
      required this.itemCount,
      required this.tabIndexProvider,
      required this.textProvider,
      required this.callbackBuilder,
      required this.child});

  final int itemCount;
  final IndexedTabIndexProvider tabIndexProvider;
  final IndexedTextProvider textProvider;
  final NullableIndexedCallbackBuilder callbackBuilder;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final TabbedViewThemeData theme = TabbedViewTheme.of(context);
    final TabbedViewMenuThemeData menuTheme = theme.menu;

    return MenuAnchor(
        child: child,
        style: menuTheme.style,
        builder:
            (BuildContext context, MenuController controller, Widget? child) {
          return GestureDetector(
              child: child,
              onTap: () {
                if (controller.isOpen) {
                  controller.close();
                } else {
                  controller.open();
                }
              });
        },
        menuChildren: [_menuItemList(context: context, menuTheme: menuTheme)]);
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
            itemCount,
            (i) => _menuItem(
                context: context,
                menuTheme: menuTheme,
                index: tabIndexProvider(i)),
          ),
        ),
      ),
    );
  }

  Widget _menuItem(
      {required BuildContext context,
      required TabbedViewMenuThemeData menuTheme,
      required int index}) {
    final String text = textProvider.call(index);
    return MenuItemButton(
        style: menuTheme.menuItemStyle,
        onPressed: callbackBuilder.call(context, index),
        child: Text(
          text,
          style: menuTheme.textStyle,
          overflow:
              menuTheme.ellipsisOverflowText ? TextOverflow.ellipsis : null,
        ));
  }
}
