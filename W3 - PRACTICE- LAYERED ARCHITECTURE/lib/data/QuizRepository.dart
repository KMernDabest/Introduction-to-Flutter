// lib/QuizRepository.dart
import 'dart:convert';
import 'dart:io';
import '../domain/quiz.dart';

class QuizRepository {
  final String filePath;
  QuizRepository(this.filePath);

  Quiz loadQuiz() {
    final file = File(filePath);
    if (!file.existsSync()) {
      throw Exception('Quiz JSON not found: $filePath');
    }

    final jsonData = jsonDecode(file.readAsStringSync());
    final title = jsonData['title'] ?? 'Quiz';

    // Load questions
    final questionsData = jsonData['questions'] as List<dynamic>;
    final questions = questionsData.map((q) {
      return Question(
        id: q['id'],
        title: q['title'],
        choices: List<String>.from(q['choices']),
        goodChoice: q['goodChoice'],
        points: (q['points'] as num?)?.toInt() ?? 1,
      );
    }).toList();

    final quiz = Quiz(questions: questions, title: title);

    // Load player submissions (optional)
    if (jsonData.containsKey('submissions')) {
      final submissionsData = jsonData['submissions'] as List<dynamic>;
      quiz.submissions = submissionsData.map((s) {
        final answers = (s['answers'] as List<dynamic>).map((a) {
          return Answer(
            questionId: a['questionId'],
            answerChoice: a['answerChoice'],
          );
        }).toList();

        return PlayerSubmission(
          playerName: s['playerName'],
          answers: answers,
          scorePercent: s['scorePercent'],
        );
      }).toList();
    }

    return quiz;
  }

  void saveQuiz(Quiz quiz) {
    final file = File(filePath);

    final data = {
      'title': quiz.title,
      'questions': quiz.questions.map((q) => {
            'id': q.id,
            'title': q.title,
            'choices': q.choices,
            'goodChoice': q.goodChoice,
            'points': q.points,
          }).toList(),
      'submissions': quiz.submissions.map((s) => {
            'playerName': s.playerName,
            'scorePercent': s.scorePercent,
            'answers': s.answers
                .map((a) => {
                      'questionId': a.questionId,
                      'answerChoice': a.answerChoice,
                    })
                .toList(),
          }).toList(),
    };

    file.writeAsStringSync(const JsonEncoder.withIndent('  ').convert(data));
  }
}
