import 'package:flutter/material.dart';

class ColorUtils {
  static RadialGradient createRadialGradient(Color baseColor) {
    return RadialGradient(
      colors: [
        Color.lerp(baseColor, Colors.white, 0.6) as Color,
        Color.lerp(baseColor, Colors.white, 0.4) as Color,
        Color.lerp(baseColor, Colors.white, 0.3) as Color,
        Color.lerp(baseColor, Colors.white, 0.2) as Color,
        Color.lerp(baseColor, Colors.white, 0.1) as Color
      ],
      stops: const [0.0, 0.3, 0.5, 0.8, 1.0],
      center: Alignment.center,
      radius: 1.0,
    );
  }
}
