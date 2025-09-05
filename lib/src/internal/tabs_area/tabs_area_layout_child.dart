import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../size_holder.dart';
import 'tabs_area_layout.dart';
import 'tabs_area_layout_parent_data.dart';

@internal
class TabsAreaLayoutChild extends ParentDataWidget<TabsAreaLayoutParentData> {
  const TabsAreaLayoutChild({
    super.key,
    required super.child,
    required this.sizeHolder,
  });

  final SizeHolder sizeHolder;

  @override
  void applyParentData(RenderObject renderObject) {
    assert(renderObject.parentData is TabsAreaLayoutParentData);
    final parentData = renderObject.parentData as TabsAreaLayoutParentData;
    if (parentData.sizeHolder != sizeHolder) {
      parentData.sizeHolder = sizeHolder;
      final targetParent = renderObject.parent;
      if (targetParent is RenderObject) {
        targetParent.markNeedsLayout();
      }
    }
  }

  @override
  Type get debugTypicalAncestorWidgetClass => TabsAreaLayout;
}
