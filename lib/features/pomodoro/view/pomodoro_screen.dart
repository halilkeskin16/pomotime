import 'package:flutter/material.dart';
import 'package:pomotime/features/pomodoro/provider/timer_provider.dart';
import 'package:pomotime/features/pomodoro/widgets/circular_timer.dart';
import 'package:pomotime/features/pomodoro/widgets/control_button.dart';
import 'package:provider/provider.dart';

class PomodoroScreen extends StatelessWidget {
  const PomodoroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TimerProvider>(
      builder: (context, timerProvider, child) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '120',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface.withValues(alpha: .7),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 24,
                    ),
                  ],
                ),
                Expanded(
                  flex: 5,
                  child: Center(
                    child: CircularTimer(
                      progress: timerProvider.progress,
                      time: timerProvider.timeDisplay,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ControlButton(
                        onPressed: () {
                          if (timerProvider.isRunning) {
                            timerProvider.pauseTimer();
                          } else {
                            timerProvider.startTimer();
                          }
                        },
                        icon: timerProvider.isRunning
                            ? Icons.pause
                            : Icons.play_arrow,
                      ),
                      
                      ControlButton(
                        onPressed: () {
                          timerProvider.resetTimer();
                        },
                        icon: Icons.refresh,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

