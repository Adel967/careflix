import 'package:flutter/cupertino.dart';

class Utils {
  static Widget clipWidget(Widget widget, {double radius = 15}) => ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        child: widget,
      );

  static Shader gradientShader(List<Color> colors) {
    return LinearGradient(
      colors: colors,
    ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
  }
}
