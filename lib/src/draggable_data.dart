import 'tab_data.dart';
import 'tabbed_view_controller.dart';

class DraggableData {
  DraggableData(this.controller, this.tabData, this.dragScope);

  final TabbedViewController controller;
  final TabData tabData;
  final String? dragScope;
}
