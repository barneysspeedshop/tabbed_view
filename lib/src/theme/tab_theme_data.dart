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
      this.verticalLayoutStyle = VerticalTabLayoutStyle.inline,
      this.rotateCaptionsInVerticalTabs = false,
      this.showCloseIconWhenNotFocused = false,
      this.selectedStatus,
      this.highlightedStatus})
      : this.buttonsOffset = buttonsOffset >= 0 ? buttonsOffset : 0,
        this.buttonsGap = buttonsGap >= 0 ? buttonsGap : 0,
        this.buttonIconSize =
            TabbedViewThemeConstants.normalize(buttonIconSize),
        this.closeIcon = closeIcon ?? IconProvider.path(TabbedViewIcons.close);

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
  TabStatusThemeData? selectedStatus;
  TabStatusThemeData? highlightedStatus;

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
  /// If a theme is returned (for [TabStatus.selected] or [TabStatus.highlighted]),
  /// its non-null properties will override the corresponding properties of the main tab theme.
  /// For [TabStatus.normal], it returns `null` as there is no specific theme to apply.
  TabStatusThemeData? getTabThemeFor(TabStatus status) {
    switch (status) {
      case TabStatus.normal:
        return null;
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
      background.hashCode ^
      borderBuilder.hashCode ^
      maxTextWidth.hashCode ^
      maxWidth.hashCode ^
      rotateCaptionsInVerticalTabs.hashCode ^
      showCloseIconWhenNotFocused.hashCode ^
      verticalLayoutStyle.hashCode ^
      selectedStatus.hashCode ^
      highlightedStatus.hashCode ^
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
