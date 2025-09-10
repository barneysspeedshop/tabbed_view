import 'dart:ui';

/// Menu item
class TabbedViewMenuItem {
  TabbedViewMenuItem({required this.text, this.onSelection});

  final String text;
  final VoidCallback? onSelection;
}
