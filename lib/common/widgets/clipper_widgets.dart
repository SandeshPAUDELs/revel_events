import 'package:flutter/material.dart' show CustomClipper, Path, Size;

class VerticalWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final waveDepth = 8.0;
    final singleWaveHeight = 20.0;
    final waveSpacing = 10.0; 

    path.moveTo(0, 0);
    path.lineTo(size.width, 0); // Start from top-right

    double currentY = 0;

    while (currentY < size.height) {
      // First half-wave (inward curve)
      path.quadraticBezierTo(
        size.width - waveDepth,
        currentY + singleWaveHeight * 0.25,
        size.width,
        currentY + singleWaveHeight * 0.5,
      );
      

      // Second half-wave (outward curve)
      path.quadraticBezierTo(
        size.width - waveDepth,
        currentY + singleWaveHeight * 0.75,
        size.width,
        currentY + singleWaveHeight,
      );

      currentY += singleWaveHeight; // next position

      if (currentY + waveSpacing < size.height) { // spacing for other 
        path.lineTo(size.width, currentY + waveSpacing);
        currentY == waveSpacing;
      } else {
        break;
      }
    }

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}