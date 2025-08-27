import '../draggable_data.dart';
import '../tabbed_view_controller.dart';

typedef CanDrop = bool Function(
    DraggableData source, TabbedViewController target);
