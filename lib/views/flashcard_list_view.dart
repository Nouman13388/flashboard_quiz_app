import 'package:flutter/material.dart';
import '../controllers/flashcard_controller.dart';

class FlashcardListView extends StatelessWidget {
  final FlashcardController flashcardController;

  const FlashcardListView({super.key, required this.flashcardController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flashcards'),
      ),
      body: ListView.builder(
        itemCount: flashcardController.flashcards.length,
        itemBuilder: (ctx, index) {
          final flashcard = flashcardController.flashcards[index];
          return ListTile(
            leading: const Icon(Icons.file_copy), // Material Icon for list item
            title: Text(flashcard.question),
            subtitle: Text(flashcard.answer),
          );
        },
      ),
    );
  }
}
