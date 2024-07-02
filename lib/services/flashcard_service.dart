import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/flashcard.dart';

class FlashcardService {
  static const String flashcardsKey = 'flashcards';

  Future<List<Flashcard>> loadFlashcards() async {
    final prefs = await SharedPreferences.getInstance();
    final flashcardsData = prefs.getString(flashcardsKey);
    if (flashcardsData == null) {
      return [];
    }

    final List<dynamic> flashcardsJson = jsonDecode(flashcardsData);
    return flashcardsJson.map((json) => Flashcard.fromJson(json)).toList();
  }

  Future<void> saveFlashcards(List<Flashcard> flashcards) async {
    final prefs = await SharedPreferences.getInstance();
    final flashcardsJson = jsonEncode(flashcards.map((flashcard) => flashcard.toJson()).toList());
    await prefs.setString(flashcardsKey, flashcardsJson);
  }
}
