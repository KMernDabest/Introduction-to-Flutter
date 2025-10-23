import '../data/QuizRepository.dart';
import '../domain/quiz.dart';
import '../ui/quiz_console.dart';

void main() {
  final repo = QuizRepository('lib/data/quiz_data.json');
  Quiz quiz;

  try {
    quiz = repo.loadQuiz();
    print('Loaded quiz "${quiz.title}" with ${quiz.questions.length} questions.\n');
  } catch (e) {
    print('Failed to load JSON: $e');
    quiz = Quiz(questions: [
      Question(title: 'Fallback', choices: ['A', 'B'], goodChoice: 'A')
    ]);
  }

  final console = QuizConsole(quiz: quiz, repo: repo);
  console.startQuiz();

  // List<Question> questions = [
  //   Question(
  //       title: "Capital of France?",
  //       choices: ["Paris", "London", "Rome"],
  //       goodChoice: "Paris"),
  //   Question(
  //       title: "2 + 2 = ?", 
  //       choices: ["2", "4", "5"], 
  //       goodChoice: "4"),
  // ];

  // Quiz quiz = Quiz(questions: questions);
  // QuizConsole console = QuizConsole(quiz: quiz);

  // console.startQuiz();

  // final score = quiz.computeScore();
  // print('Score: $score');
}
