import 'package:flutter/material.dart';

import 'colors.dart';

RadialGradient backgroundRadialGradient({required center, transform}) {
  return RadialGradient(
    colors: const [
      Color(0xFF314941),
      Color(0xFF2c4139),
      Color(0xFF273834),
      Color(0xFF22302d),
      Color(0xFF1d2826),
      veryDarkTurquoise,
    ],
    stops: const [
      // 0.1,
      0.25,
      0.35,
      0.5,
      0.6,
      0.75,
      0.9,
    ],
    center: center,
    radius: 0.7,
    transform: transform,
  );
}
