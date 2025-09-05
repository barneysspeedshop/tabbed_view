import 'package:flutter/rendering.dart';
import 'package:meta/meta.dart';
import 'package:tabbed_view/src/internal/size_holder.dart';

/// Parent data for [_TabsAreaLayoutRenderBox] class.
@internal
class TabsAreaLayoutParentData extends ContainerBoxParentData<RenderBox> {
  bool visible = true;
  bool selected = false;
  SizeHolder? sizeHolder;

  /// Resets all values.
  void reset() {
    visible = true;
    selected = false;
  }
}

/// Utility extension to facilitate obtaining parent data.
@internal
extension TabsAreaLayoutParentDataGetter on RenderObject {
  TabsAreaLayoutParentData tabsAreaLayoutParentData() {
    return parentData as TabsAreaLayoutParentData;
  }
}
