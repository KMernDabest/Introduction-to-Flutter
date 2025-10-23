// lib/ui/quiz_console.dart
import 'dart:io';
import '../domain/quiz.dart';
import '../data/QuizRepository.dart';

class QuizConsole {
  final Quiz quiz;
  final QuizRepository repo;

  QuizConsole({required this.quiz, required this.repo});

  void startQuiz() {
    print('--- ${quiz.title} ---\n');

    while (true) {
      stdout.write('Enter player name (empty to quit): ');
      final playerName = stdin.readLineSync()?.trim() ?? '';
      if (playerName.isEmpty) {
        print('\nExiting. Final submissions:');
        _printSubmissions();
        break;
      }

      quiz.clearAnswers();
      print('\nHello, $playerName — starting the quiz.\n');

      for (var q in quiz.questions) {
        print('Question: ${q.title} (points: ${q.points})');
        for (var i = 0; i < q.choices.length; i++) {
          print('  ${i + 1}) ${q.choices[i]}');
        }

        stdout.write('Your answer: ');
        final input = stdin.readLineSync() ?? '';
        String chosenText = '';

        if (input.trim().isEmpty) {
          chosenText = '';
        } else {
          final idx = int.tryParse(input.trim());
          if (idx != null && idx >= 1 && idx <= q.choices.length) {
            chosenText = q.choices[idx - 1];
          } else {
            final match = q.choices.firstWhere(
              (c) => c.toLowerCase() == input.toLowerCase(),
              orElse: () => '',
            );
            chosenText = match.isEmpty ? input : match;
          }
        }

        quiz.addAnswer(Answer(questionId: q.id, answerChoice: chosenText));
        print('');
      }

      final earned = quiz.getEarnedPoints();
      final pct = quiz.getScoreInPercentage();

      quiz.addSubmission(playerName);
      repo.saveQuiz(quiz); // 🔥 persist submission

      print('--- Result for $playerName ---');
      print('Points: $earned/${quiz.totalPoints()}');
      print('Percentage: $pct%');
      print('\n--- Submissions ---');
      _printSubmissions();
      print('');
    }
  }

  void _printSubmissions() {
    if (quiz.submissions.isEmpty) {
      print('  (no submissions yet)');
      return;
    }

    for (var s in quiz.submissions) {
      print('  ${s.playerName} -> ${s.scorePercent}%');
    }
  }
}

