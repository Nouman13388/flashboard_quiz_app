import 'package:flutter/material.dart';
import '../controllers/quiz_controller.dart';

class QuizView extends StatefulWidget {
  final QuizController quizController;

  const QuizView({super.key, required this.quizController});

  @override
  _QuizViewState createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> {
  bool _showAnswer = false;

  void _nextFlashcard(bool correct) {
    setState(() {
      widget.quizController.nextFlashcard(correct);
      _showAnswer = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.quizController.isQuizFinished) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Quiz Finished'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Quiz Finished!'),
              Text(
                'Your Score: ${widget.quizController.score}/${widget.quizController.flashcards.length}',
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    widget.quizController.resetQuiz();
                  });
                },
                icon: const Icon(Icons.refresh), // Material Icon for Restart
                label: const Text('Restart Quiz'),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.quizController.currentFlashcard.question,
              style: const TextStyle(fontSize: 24),
            ),
            if (_showAnswer)
              Text(
                widget.quizController.currentFlashcard.answer,
                style: const TextStyle(fontSize: 20, color: Colors.grey),
              ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  _showAnswer = true;
                });
              },
              icon: const Icon(Icons.visibility), // Material Icon for Show
              label: const Text('Show Answer'),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  onPressed: () => _nextFlashcard(true),
                  icon: const Icon(Icons.check), // Material Icon for Correct
                  label: const Text('Correct'),
                ),
                ElevatedButton.icon(
                  onPressed: () => _nextFlashcard(false),
                  icon: const Icon(Icons.close), // Material Icon for Incorrect
                  label: const Text('Incorrect'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
