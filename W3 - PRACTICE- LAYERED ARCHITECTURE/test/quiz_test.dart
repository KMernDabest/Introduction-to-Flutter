import 'package:test/test.dart';
import '../lib/domain/quiz.dart';

main() {
  group('Quiz domain logic (matches quiz_data.json)', () {
    // Match exactly the JSON data
    final q1 = Question(
      id: 'q-1',
      title: 'Capital of France?',
      choices: ['Paris', 'London', 'Rome'],
      goodChoice: 'Paris',
      points: 10,
    );

    final q2 = Question(
      id: 'q-2',
      title: '2 + 2 = ?',
      choices: ['2', '4', '5'],
      goodChoice: '4',
      points: 10,
    );

    final quiz = Quiz(
      questions: [q1, q2],
      title: 'Sample Quiz (from JSON)',
    );

    test('Score 100% when all answers are correct', () {
      final answers = [
        Answer(questionId: 'q-1', answerChoice: 'Paris'),
        Answer(questionId: 'q-2', answerChoice: '4'),
      ];

      final earnedPoints = quiz.getEarnedPoints(answers);
      final pct = quiz.getScoreInPercentage(answers);

      expect(earnedPoints, equals(20)); // 10 + 10
      expect(pct, equals(100));
    });

    test('Score 50% when one answer is correct', () {
      final answers = [
        Answer(questionId: 'q-1', answerChoice: 'Paris'),
        Answer(questionId: 'q-2', answerChoice: '5'),
      ];

      final earnedPoints = quiz.getEarnedPoints(answers);
      final pct = quiz.getScoreInPercentage(answers);

      expect(earnedPoints, equals(10)); // 1 correct = 10 pts
      expect(pct, equals(50)); // 10/20 = 50%
    });

    test('Adding player submissions works', () {
      final ronanAnswers = [
        Answer(questionId: 'q-1', answerChoice: 'Paris'),
        Answer(questionId: 'q-2', answerChoice: '4'),
      ];
      quiz.addSubmission('Ronan', ronanAnswers);

      final doggyAnswers = [
        Answer(questionId: 'q-1', answerChoice: 'London'),
        Answer(questionId: 'q-2', answerChoice: '4'),
      ];
      quiz.addSubmission('DoggyFat', doggyAnswers);

      expect(quiz.submissions.length, equals(2));
      expect(quiz.submissions[0].playerName, equals('DoggyFat'));
      expect(quiz.submissions[1].playerName, equals('Ronan'));
    });
  });
}
