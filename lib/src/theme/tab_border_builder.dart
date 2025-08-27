import 'package:flutter/material.dart';

import '../tab_bar_position.dart';
import '../tab_status.dart';

typedef TabBorderBuilder = TabBorder Function(
    {required TabBarPosition tabBarPosition, required TabStatus status});

class TabBorder {
  TabBorder({this.borderRadius, this.border, this.wrapperBorderBuilder});

  final BorderRadius? borderRadius;
  final Border? border;
  final TabBorderBuilder? wrapperBorderBuilder;
}
