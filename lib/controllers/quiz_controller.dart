import '../models/flashcard.dart';

class QuizController {
  List<Flashcard> flashcards;
  int currentIndex = 0;
  int score = 0;

  QuizController({required this.flashcards});

  Flashcard get currentFlashcard => flashcards[currentIndex];

  void nextFlashcard(bool correct) {
    if (correct) {
      score++;
    }
    currentIndex++;
  }

  bool get isQuizFinished => currentIndex >= flashcards.length;

  void resetQuiz() {
    currentIndex = 0;
    score = 0;
  }
}
