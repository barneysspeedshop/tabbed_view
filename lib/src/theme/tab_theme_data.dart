import 'package:flutter/material.dart';
import 'package:tabbed_view/tabbed_view.dart';

/// Theme for tab.
class TabThemeData {
  static TabBorder defaultBorderBuilder(
      {required TabBarPosition tabBarPosition, required TabStatus status}) {
    return TabBorder();
  }

  TabThemeData(
      {IconProvider? closeIcon,
      this.background,
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
      this.maxTextWidth,
      this.maxWidth,
      this.padding,
      this.paddingWithoutButton,
      this.margin,
      TabStatusThemeData? selectedStatus,
      this.verticalLayoutStyle = VerticalTabLayoutStyle.inline,
      this.rotateCaptionsInVerticalTabs = false,
      this.showCloseIconWhenNotFocused = false,
      TabStatusThemeData? highlightedStatus,
      TabStatusThemeData? disabledStatus})
      : this.buttonsOffset = buttonsOffset >= 0 ? buttonsOffset : 0,
        this.buttonsGap = buttonsGap >= 0 ? buttonsGap : 0,
        this.buttonIconSize =
            TabbedViewThemeConstants.normalize(buttonIconSize),
        this.closeIcon = closeIcon ?? IconProvider.path(TabbedViewIcons.close),
        this.selectedStatus = selectedStatus ?? const TabStatusThemeData(),
        this.highlightedStatus =
            highlightedStatus ?? const TabStatusThemeData(),
        this.disabledStatus = disabledStatus ?? const TabStatusThemeData();

  Color? background;

  TabBorderBuilder borderBuilder;

  /// The maximum width for the tab text. If the text exceeds this width, it
  /// will be truncated with an ellipsis.
  double? maxTextWidth;

  /// The maximum width for the tab. For vertical tabs, this will be the maximum
  /// height.
  double? maxWidth;

  /// If `true`, characters within vertical tab text will also be rotated
  /// along with the tab. If `false` (default), characters will remain upright
  /// while the text flows vertically.
  ///
  /// This property is only effective when [verticalLayoutStyle] is
  /// [VerticalTabLayoutStyle.inline].
  bool rotateCaptionsInVerticalTabs;

  bool showCloseIconWhenNotFocused;

  /// Defines the layout style for a tab in a vertical [TabBar].
  ///
  /// [VerticalTabLayoutStyle.inline] will arrange the tab's internal components
  /// (leading, text, and buttons) in a row.
  ///
  /// [VerticalTabLayoutStyle.stacked] will arrange the tab's internal components
  /// in a column.
  VerticalTabLayoutStyle verticalLayoutStyle;
  TabStatusThemeData selectedStatus;
  TabStatusThemeData highlightedStatus;
  final TabStatusThemeData disabledStatus;

  /// Empty space to inscribe inside the [decoration]. The tab child, if any, is
  /// placed inside this padding.
  ///
  /// This padding is in addition to any padding inherent in the [decoration];
  /// see [Decoration.padding].
  EdgeInsetsGeometry? padding;

  EdgeInsetsGeometry? paddingWithoutButton;

  EdgeInsetsGeometry? margin;

  VerticalAlignment verticalAlignment;

  double buttonsOffset;

  BoxDecoration? decoration;
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

  /// Gets the theme of a tab according to its status.
  TabStatusThemeData getTabThemeFor(TabStatus status) {
    switch (status) {
      case TabStatus.normal:
        return TabStatusThemeData.empty;
      case TabStatus.selected:
        return selectedStatus;
      case TabStatus.highlighted:
        return highlightedStatus;
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TabThemeData &&
          runtimeType == other.runtimeType &&
          background == other.background &&
          borderBuilder == other.borderBuilder &&
          maxTextWidth == other.maxTextWidth &&
          maxWidth == other.maxWidth &&
          rotateCaptionsInVerticalTabs == other.rotateCaptionsInVerticalTabs &&
          showCloseIconWhenNotFocused == other.showCloseIconWhenNotFocused &&
          verticalLayoutStyle == other.verticalLayoutStyle &&
          selectedStatus == other.selectedStatus &&
          highlightedStatus == other.highlightedStatus &&
          disabledStatus == other.disabledStatus &&
          padding == other.padding &&
          paddingWithoutButton == other.paddingWithoutButton &&
          margin == other.margin &&
          verticalAlignment == other.verticalAlignment &&
          buttonsOffset == other.buttonsOffset &&
          decoration == other.decoration &&
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
      background.hashCode ^
      borderBuilder.hashCode ^
      maxTextWidth.hashCode ^
      maxWidth.hashCode ^
      rotateCaptionsInVerticalTabs.hashCode ^
      showCloseIconWhenNotFocused.hashCode ^
      verticalLayoutStyle.hashCode ^
      selectedStatus.hashCode ^
      highlightedStatus.hashCode ^
      disabledStatus.hashCode ^
      padding.hashCode ^
      paddingWithoutButton.hashCode ^
      margin.hashCode ^
      verticalAlignment.hashCode ^
      buttonsOffset.hashCode ^
      decoration.hashCode ^
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
