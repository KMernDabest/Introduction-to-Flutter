import 'package:uuid/uuid.dart';

final _uuid = Uuid();

class Question{
  final String title;
  final List<String> choices;
  final String goodChoice;
  final int points;
  final String id;

  Question({required this.title, required this.choices, required this.goodChoice, this.points = 1, String? id}) : id = id ?? _uuid.v4();
}

class Answer{
  final String questionId;
  final String answerChoice;

  Answer({required this.questionId, required this.answerChoice});

  bool isGood(Quiz quiz){
    try {
      final question = quiz.getQuestionById(this.questionId);
      return this.answerChoice == question.goodChoice;
    } catch (e) {
      return false;
    }
  }
}

class PlayerSubmission{
  final String playerName;
  final List<Answer> answers;
  final int scorePercent;

  PlayerSubmission({required this.playerName, required this.answers, required this.scorePercent});
}

class Quiz{
  List<Question> questions;
  List<Answer> answers = [];
  final String title;
  List<PlayerSubmission> submissions = [];

  Quiz({required this.questions, this.title = 'Quiz'});

  Question getQuestionById(String id) {
    return questions.firstWhere((q) => q.id == id);
  }

  void addAnswer(Answer answer) {
    this.answers.add(answer);
  }

  void clearAnswers() {
    this.answers.clear();
  }

  int totalPoints() => questions.fold(0, (sum, question) => sum + question.points);

  int getEarnedPoints() {
    int earned = 0;
    for (var a in answers) {
      try {
        final q = getQuestionById(a.questionId);
        if (a.answerChoice == q.goodChoice) {
          earned += q.points;
        }
      } catch (e) {
        // Handle error (e.g., question not found)
      }
    }
    return earned;
  }

  int getScoreInPercentage(){
    int total = totalPoints();
    if (total == 0) return 0;
    final earned = getEarnedPoints();
    return ((earned / total) * 100).toInt();
  }

  void addSubmission(String playerName) {
    final pct = getScoreInPercentage();
    submissions.removeWhere((s) => s.playerName == playerName);
    submissions.insert(
      0,
      PlayerSubmission(
        playerName: playerName,
        answers: List.from(answers),
        scorePercent: pct,
      ),
    );
  }
}