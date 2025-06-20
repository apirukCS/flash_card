class QuizResultModel {
  final int id;
  final int levelId;
  final String userId;
  final int score;
  final int totalQuestions;
  final int? completionTime;
  final bool passed;
  final DateTime quizDate;

  const QuizResultModel({
    required this.id,
    required this.levelId,
    required this.userId,
    required this.score,
    required this.totalQuestions,
    this.completionTime,
    this.passed = false,
    required this.quizDate,
  });

  double get percentage => (score / totalQuestions) * 100;
}