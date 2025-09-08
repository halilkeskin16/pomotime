import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pomotime/features/pomodoro/provider/timer_provider.dart';
import 'package:pomotime/features/pomodoro/widgets/circular_timer.dart';
import 'package:pomotime/features/pomodoro/widgets/control_button.dart';
import 'package:provider/provider.dart';


const List<String> _motivationalMessages = [
  "Harika iş! Odaklanmak bir süper güçtür.",
  "Bir adım daha tamamlandı. Başarıya giden yol böyle döşenir.",
  "Zihnini dinlendirme zamanı. Bunu hak ettin!",
  "Odaklanma serin devam ediyor. Bravo!",
];

class PomodoroScreen extends StatelessWidget {
  const PomodoroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = FirebaseAuth.instance;
    return Consumer<TimerProvider>(
      builder: (context, timerProvider, child) {
        if (timerProvider.timerState == TimerState.finished) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _showCompletionDialog(context, timerProvider);
          });
        }

        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Pomodoro Zamanlayıcı'),
              centerTitle: true,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () {
                  authProvider.signOut();
                  Navigator.pushReplacementNamed(context, '/login');
                },
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        'Odak Pomo',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '120', 
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withAlpha((255 * 0.7).round()),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(
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
                        if (timerProvider.timerState != TimerState.running)
                          ControlButton(
                            onPressed: () => timerProvider.startTimer(),
                            icon: Icons.play_arrow,
                          ),
                        if (timerProvider.timerState == TimerState.running)
                          ControlButton(
                            onPressed: () => timerProvider.pauseTimer(),
                            icon: Icons.pause,
                          ),
                        
                        ControlButton(
                          onPressed: () => timerProvider.resetTimer(),
                          icon: Icons.refresh,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showCompletionDialog(BuildContext context, TimerProvider provider) {
    final randomMessage = _motivationalMessages[Random().nextInt(_motivationalMessages.length)];

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          icon: Icon(Icons.check_circle_outline, color: Theme.of(context).primaryColor, size: 50),
          title: const Text('Tebrikler!', textAlign: TextAlign.center),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(randomMessage, textAlign: TextAlign.center),
              const SizedBox(height: 16),
              Chip(
                label: Text(
                  '+ ${provider.lastEarnedCoins} Coin Kazandın',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          actions: [
            Center(
              child: TextButton(
                child: const Text('Harika!', style: TextStyle(fontSize: 16)),
                onPressed: () {
                  provider.resetTimer();
                  Navigator.of(dialogContext).pop();
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

