import 'package:flutter/material.dart';
import '../controllers/flashcard_controller.dart';
import '../models/flashcard.dart';

class AddFlashcardView extends StatefulWidget {
  final FlashcardController flashcardController;

  const AddFlashcardView({super.key, required this.flashcardController});

  @override
  _AddFlashcardViewState createState() => _AddFlashcardViewState();
}

class _AddFlashcardViewState extends State<AddFlashcardView> {
  final _questionController = TextEditingController();
  final _answerController = TextEditingController();

  void _submitData() {
    final enteredQuestion = _questionController.text;
    final enteredAnswer = _answerController.text;

    if (enteredQuestion.isEmpty || enteredAnswer.isEmpty) {
      return;
    }

    widget.flashcardController.addFlashcard(
      Flashcard(question: enteredQuestion, answer: enteredAnswer),
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Flashcard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Question',
                prefixIcon: Icon(Icons.question_answer), // Material Icon for question
              ),
              controller: _questionController,
            ),
            const SizedBox(height: 16.0), // Add spacing between fields
            TextField(
              decoration: const InputDecoration(
                labelText: 'Answer',
                prefixIcon: Icon(Icons.lightbulb_outline), // Material Icon for answer
              ),
              controller: _answerController,
            ),
            const SizedBox(height: 20.0),
            ElevatedButton.icon(
              onPressed: _submitData,
              icon: const Icon(Icons.add), // Material Icon for Add
              label: const Text('Add Flashcard'),
            ),
          ],
        ),
      ),
    );
  }
}
