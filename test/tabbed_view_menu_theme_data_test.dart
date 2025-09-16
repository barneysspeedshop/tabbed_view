import 'package:flutter_test/flutter_test.dart';
import 'package:tabbed_view/src/theme/tabbed_view_menu_theme_data.dart';

void main() {
  group('menu icon', () {
    test('default', () {
      TabbedViewMenuThemeData data = TabbedViewMenuThemeData();
      expect(data.menuIcon.iconData, isNull);
      expect(data.menuIcon.iconPath, isNotNull);
    });
  });
}
