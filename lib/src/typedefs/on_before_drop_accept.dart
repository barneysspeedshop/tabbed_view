import '../draggable_data.dart';
import '../tabbed_view_controller.dart';

typedef OnBeforeDropAccept = bool Function(
    DraggableData source, TabbedViewController target, int newIndex);
