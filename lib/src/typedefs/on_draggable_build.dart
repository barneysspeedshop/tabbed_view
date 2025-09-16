import '../draggable_config.dart';
import '../tab_data.dart';
import '../tabbed_view_controller.dart';

/// Defines the configuration of a [Draggable] in its construction.
typedef OnDraggableBuild = DraggableConfig Function(
    TabbedViewController controller, int tabIndex, TabData tab);
