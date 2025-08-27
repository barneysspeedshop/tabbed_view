import 'package:flutter/material.dart';

import '../icon_provider.dart';
import '../tab_bar_position.dart';
import '../tab_status.dart';
import '../tabbed_view_icons.dart';
import 'tab_border_builder.dart';
import 'tab_status_theme_data.dart';
import 'tabbed_view_theme_constants.dart';
import 'vertical_alignment.dart';
import 'side_tabs_layout.dart';

/// Theme for tab.
class TabThemeData {
  static TabBorder defaultBorderBuilder(
      {required TabBarPosition tabBarPosition, required TabStatus status}) {
    return TabBorder();
  }

  TabThemeData(
      {IconProvider? closeIcon,
      this.color,
      this.normalButtonColor = Colors.black,
      this.hoverButtonColor = Colors.black,
      this.disabledButtonColor = Colors.black12,
      this.normalButtonBackground,
      this.hoverButtonBackground,
      this.disabledButtonBackground,
      double buttonIconSize = TabbedViewThemeConstants.defaultIconSize,
      this.verticalAlignment = VerticalAlignment.center,
      double buttonsOffset = 0,
      this.buttonPadding,
      double buttonsGap = 0,
      this.borderBuilder = TabThemeData.defaultBorderBuilder,
      this.draggingDecoration,
      this.draggingOpacity = 0.3,
      this.textStyle = const TextStyle(fontSize: 13),
      this.maxMainSize,
      this.padding,
      this.paddingWithoutButton,
      this.sideTabsLayout = SideTabsLayout.rotated,
      required this.selectedStatus,
      required this.hoveredStatus})
      : this.buttonsOffset = buttonsOffset >= 0 ? buttonsOffset : 0,
        this.buttonsGap = buttonsGap >= 0 ? buttonsGap : 0,
        this.buttonIconSize =
            TabbedViewThemeConstants.normalize(buttonIconSize),
        this.closeIcon = closeIcon ?? IconProvider.path(TabbedViewIcons.close);

  Color? color;

  TabBorderBuilder borderBuilder;

  /// The maximum main size of the tab.
  ///
  /// This will be its width when the tab is displayed horizontally,
  /// and its height when displayed vertically.
  double? maxMainSize;

  /// Defines how side-positioned tabs (left or right) are laid out.
  SideTabsLayout sideTabsLayout;

  TabStatusThemeData selectedStatus;
  TabStatusThemeData hoveredStatus;

  /// Padding for tab content
  EdgeInsetsGeometry? padding;

  EdgeInsetsGeometry? paddingWithoutButton;

  VerticalAlignment verticalAlignment;

  double buttonsOffset;

  BoxDecoration? draggingDecoration;
  double draggingOpacity;

  TextStyle? textStyle;

  double buttonIconSize;
  Color normalButtonColor;
  Color hoverButtonColor;
  Color disabledButtonColor;
  BoxDecoration? normalButtonBackground;
  BoxDecoration? hoverButtonBackground;
  BoxDecoration? disabledButtonBackground;

  /// Icon for the close button.
  IconProvider closeIcon;

  EdgeInsetsGeometry? buttonPadding;

  double buttonsGap;

  /// Gets an optional theme for a tab based on its [status].
  ///
  /// If a theme is returned (for [TabStatus.selected] or [TabStatus.hovered]),
  /// its non-null properties will override the corresponding properties of the main tab theme.
  /// For [TabStatus.normal], it returns `null` as there is no specific theme to apply.
  TabStatusThemeData? getTabThemeFor(TabStatus status) {
    switch (status) {
      case TabStatus.normal:
        return null;
      case TabStatus.selected:
        return selectedStatus;
      case TabStatus.hovered:
        return hoveredStatus;
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TabThemeData &&
          runtimeType == other.runtimeType &&
          color == other.color &&
          borderBuilder == other.borderBuilder &&
          maxMainSize == other.maxMainSize &&
          sideTabsLayout == other.sideTabsLayout &&
          selectedStatus == other.selectedStatus &&
          hoveredStatus == other.hoveredStatus &&
          padding == other.padding &&
          paddingWithoutButton == other.paddingWithoutButton &&
          verticalAlignment == other.verticalAlignment &&
          buttonsOffset == other.buttonsOffset &&
          draggingDecoration == other.draggingDecoration &&
          draggingOpacity == other.draggingOpacity &&
          textStyle == other.textStyle &&
          buttonIconSize == other.buttonIconSize &&
          normalButtonColor == other.normalButtonColor &&
          hoverButtonColor == other.hoverButtonColor &&
          disabledButtonColor == other.disabledButtonColor &&
          normalButtonBackground == other.normalButtonBackground &&
          hoverButtonBackground == other.hoverButtonBackground &&
          disabledButtonBackground == other.disabledButtonBackground &&
          closeIcon == other.closeIcon &&
          buttonPadding == other.buttonPadding &&
          buttonsGap == other.buttonsGap;

  @override
  int get hashCode =>
      color.hashCode ^
      borderBuilder.hashCode ^
      maxMainSize.hashCode ^
      sideTabsLayout.hashCode ^
      selectedStatus.hashCode ^
      hoveredStatus.hashCode ^
      padding.hashCode ^
      paddingWithoutButton.hashCode ^
      verticalAlignment.hashCode ^
      buttonsOffset.hashCode ^
      draggingDecoration.hashCode ^
      draggingOpacity.hashCode ^
      textStyle.hashCode ^
      buttonIconSize.hashCode ^
      normalButtonColor.hashCode ^
      hoverButtonColor.hashCode ^
      disabledButtonColor.hashCode ^
      normalButtonBackground.hashCode ^
      hoverButtonBackground.hashCode ^
      disabledButtonBackground.hashCode ^
      closeIcon.hashCode ^
      buttonPadding.hashCode ^
      buttonsGap.hashCode;
}
