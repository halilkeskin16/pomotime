import 'package:flutter/material.dart';

class CircularTimer extends StatelessWidget {
  const CircularTimer({super.key, required this.progress, required this.time});
  final double progress;
  final String time;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double size = constraints.maxWidth;
          final double strokeWidth = size / 20;
          final double fontSize = size / 4;

          return Stack(
            fit: StackFit.expand,
            children: [
              CircularProgressIndicator(
                value: progress,
                strokeWidth: strokeWidth,
                backgroundColor: Colors.grey.withValues(alpha: .2),
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).colorScheme.primary,
                ),
              ),
              Center(
                child: Text(
                  time,
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}