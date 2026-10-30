import 'package:flutter/material.dart';

class GuidelineOverlay extends StatelessWidget {
  const GuidelineOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return IgnorePointer(
      child: SizedBox.expand(
        child: CustomPaint(
          painter: GuidelinePainter(
            appBarBottom: mediaQuery.padding.top + 56,
            navigationBarTop:
                mediaQuery.size.height - mediaQuery.padding.bottom,
            bottomNavTop:
                mediaQuery.size.height -
                mediaQuery.padding.bottom -
                kBottomNavigationBarHeight,
            bottomNavBottom: mediaQuery.size.height - mediaQuery.padding.bottom,
          ),
        ),
      ),
    );
  }
}

class GuidelinePainter extends CustomPainter {
  final double appBarBottom;
  final double navigationBarTop;
  final double bottomNavTop;
  final double bottomNavBottom;

  const GuidelinePainter({
    required this.appBarBottom,
    required this.navigationBarTop,
    required this.bottomNavTop,
    required this.bottomNavBottom,
  });

  @override
  void paint(Canvas canvas, Size size) {
    const double padding = 16.0;
    const double spacing = 16.0;

    final double contentWidth = size.width - padding * 2;
    final double columnWidth = (contentWidth - spacing * 3) / 4;

    final borderPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    // Khung chữ nhật bên ngoài
    canvas.drawRect(
      Rect.fromLTRB(padding, 0, size.width - padding, size.height),
      borderPaint,
    );

    // 4 cột mờ
    final columnPaint = Paint()
      ..color = Colors.red.withValues(alpha: 0.12)
      ..style = PaintingStyle.fill;

    for (int i = 0; i < 4; i++) {
      final double left = padding + i * (columnWidth + spacing);

      canvas.drawRect(
        Rect.fromLTWH(left, 0, columnWidth, size.height),
        columnPaint,
      );
    }

    // Đường ngang dưới AppBar
    canvas.drawLine(
      Offset(0, appBarBottom),
      Offset(size.width, appBarBottom),
      borderPaint,
    );

    // Đường ngang phía trên Navigation Bar hệ thống
    canvas.drawLine(
      Offset(0, navigationBarTop),
      Offset(size.width, navigationBarTop),
      borderPaint,
    );

    // Đường trên BottomNavigationBar
    canvas.drawLine(
      Offset(0, bottomNavTop),
      Offset(size.width, bottomNavTop),
      borderPaint,
    );

    // Đường dưới BottomNavigationBar
    canvas.drawLine(
      Offset(0, bottomNavBottom),
      Offset(size.width, bottomNavBottom),
      borderPaint,
    );
  }

  @override
  bool shouldRepaint(covariant GuidelinePainter oldDelegate) {
    return oldDelegate.appBarBottom != appBarBottom ||
        oldDelegate.navigationBarTop != navigationBarTop ||
        oldDelegate.bottomNavTop != bottomNavTop ||
        oldDelegate.bottomNavBottom != bottomNavBottom;
  }
}
