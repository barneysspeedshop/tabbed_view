import 'package:flutter/material.dart';
import 'package:tabbed_view/tabbed_view.dart';

/// A border that mimics the shape of a manila folder tab.
class ManilaFolderTabBorder extends ShapeBorder {
  const ManilaFolderTabBorder({
    required this.tabBarPosition,
    required this.borderSide,
    this.angle = 10.0,
  });

  final TabBarPosition tabBarPosition;
  final BorderSide borderSide;
  final double angle;

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return getOuterPath(rect, textDirection: textDirection);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    Path path = Path();
    double slant = angle;

    switch (tabBarPosition) {
      case TabBarPosition.top:
        path.moveTo(rect.left, rect.bottom);
        path.lineTo(rect.left + slant, rect.top);
        path.lineTo(rect.right - slant, rect.top);
        path.lineTo(rect.right, rect.bottom);
        path.close();
        break;
      case TabBarPosition.bottom:
        path.moveTo(rect.left, rect.top);
        path.lineTo(rect.left + slant, rect.bottom);
        path.lineTo(rect.right - slant, rect.bottom);
        path.lineTo(rect.right, rect.top);
        path.close();
        break;
      case TabBarPosition.left:
        path.moveTo(rect.right, rect.top);
        path.lineTo(rect.left, rect.top + slant);
        path.lineTo(rect.left, rect.bottom - slant);
        path.lineTo(rect.right, rect.bottom);
        path.close();
        break;
      case TabBarPosition.right:
        path.moveTo(rect.left, rect.top);
        path.lineTo(rect.right, rect.top + slant);
        path.lineTo(rect.right, rect.bottom - slant);
        path.lineTo(rect.left, rect.bottom);
        path.close();
        break;
    }
    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    // Then, draw the border lines.
    final borderPaint = borderSide.toPaint();
    // We need to draw the border as separate lines because a single path stroke
    // won't work correctly for shapes that aren't closed.
    final double slant = angle;

    switch (tabBarPosition) {
      case TabBarPosition.top:
        canvas.drawLine(Offset(rect.left, rect.bottom),
            Offset(rect.left + slant, rect.top), borderPaint); // Left
        canvas.drawLine(Offset(rect.left + slant, rect.top),
            Offset(rect.right - slant, rect.top), borderPaint); // Top
        canvas.drawLine(Offset(rect.right - slant, rect.top),
            Offset(rect.right, rect.bottom), borderPaint); // Right
        break;
      case TabBarPosition.bottom:
        canvas.drawLine(Offset(rect.left, rect.top),
            Offset(rect.left + slant, rect.bottom), borderPaint); // Left
        canvas.drawLine(Offset(rect.left + slant, rect.bottom),
            Offset(rect.right - slant, rect.bottom), borderPaint); // Bottom
        canvas.drawLine(Offset(rect.right - slant, rect.bottom),
            Offset(rect.right, rect.top), borderPaint); // Right
        break;
      case TabBarPosition.left:
        canvas.drawLine(Offset(rect.right, rect.top),
            Offset(rect.left, rect.top + slant), borderPaint); // Top
        canvas.drawLine(Offset(rect.left, rect.top + slant),
            Offset(rect.left, rect.bottom - slant), borderPaint); // Left
        canvas.drawLine(Offset(rect.left, rect.bottom - slant),
            Offset(rect.right, rect.bottom), borderPaint); // Bottom
        break;
      case TabBarPosition.right:
        canvas.drawLine(Offset(rect.left, rect.top),
            Offset(rect.right, rect.top + slant), borderPaint); // Top
        canvas.drawLine(Offset(rect.right, rect.top + slant),
            Offset(rect.right, rect.bottom - slant), borderPaint); // Right
        canvas.drawLine(Offset(rect.right, rect.bottom - slant),
            Offset(rect.left, rect.bottom), borderPaint); // Bottom
        break;
    }
  }

  @override
  ShapeBorder scale(double t) => this;
}
