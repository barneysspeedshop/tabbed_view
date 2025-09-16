import 'package:flutter_test/flutter_test.dart';
import 'package:tabbed_view/src/theme/tab_status_theme_data.dart';
import 'package:tabbed_view/src/theme/tab_theme_data.dart';

void main() {
  group('close icon', () {
    test('default', () {
      TabThemeData data = TabThemeData(
          selectedStatus: TabStatusThemeData(),
          hoveredStatus: TabStatusThemeData());
      expect(data.closeIcon.iconData, isNull);
      expect(data.closeIcon.iconPath, isNotNull);
    });
  });
}
