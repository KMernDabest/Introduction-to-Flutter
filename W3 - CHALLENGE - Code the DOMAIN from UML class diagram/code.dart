class Quiz {
  final List<Question> questions;
  final List<Answer> answers;

  Quiz({required this.questions, required this.answers});
  
  void addAnswer(Answer answer) {
    answers.add(answer);
  }

  int getScore() {
    int score = 0;
    for (var answer in answers) {
      if (answer.isGoodAnswer()) {
        score++;
      }
    }
    return score;
  }
}

class Question {
  final String title;
  final List<String> choices;
  final String goodChoice;

  Question({required this.title, required this.choices, required this.goodChoice});

  bool isGoodChoice(String answer) {
    return answer == goodChoice;
  }
}

class Answer {
  final String answerChoice;
  final Question question;

  Answer({required this.answerChoice, required this.question});

  bool isGoodAnswer() {
    return question.isGoodChoice(answerChoice);
  }
}
