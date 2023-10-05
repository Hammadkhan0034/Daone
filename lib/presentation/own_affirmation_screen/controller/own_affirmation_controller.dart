
import 'package:confetti/confetti.dart';
import 'package:daone/core/app_export.dart';

class OwnAffirmationController extends GetxController{
  final confettiController = ConfettiController(duration: const Duration(seconds: 5));

  void playConfetti() {
    confettiController.play();
  }

  @override
  void dispose() {
    confettiController.dispose();
    super.dispose();
  }
}