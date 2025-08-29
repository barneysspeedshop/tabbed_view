import 'package:flutter/material.dart';

import '../tab_bar_position.dart';
import '../tab_status.dart';

/// A builder function that creates a `TabBorder` based on the tab's position and status.
typedef TabBorderBuilder = TabBorder Function(
    {required TabBarPosition tabBarPosition, required TabStatus status});

/// Defines the border of a tab, which can include a border, a border radius,
/// and a wrapper builder for creating nested borders.
class TabBorder {
  TabBorder({this.borderRadius, this.border, this.wrapperBorderBuilder});

  /// The radius to be applied to the corners of the tab border.
  final BorderRadius? borderRadius;

  /// The border of the tab.
  final Border? border;

  /// An optional builder that can be used to wrap this border with another
  /// `TabBorder`, allowing for the creation of composable borders.
  final TabBorderBuilder? wrapperBorderBuilder;
}
