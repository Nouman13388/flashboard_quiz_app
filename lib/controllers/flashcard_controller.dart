import '../models/flashcard.dart';
import '../services/flashcard_service.dart';

class FlashcardController {
  final FlashcardService _flashcardService = FlashcardService();
  List<Flashcard> _flashcards = [];

  List<Flashcard> get flashcards => _flashcards;

  Future<void> loadFlashcards() async {
    _flashcards = await _flashcardService.loadFlashcards();
  }

  Future<void> addFlashcard(Flashcard flashcard) async {
    _flashcards.add(flashcard);
    await _flashcardService.saveFlashcards(_flashcards);
  }
}
