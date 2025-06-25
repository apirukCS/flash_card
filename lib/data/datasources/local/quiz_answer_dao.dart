import 'package:flash_card/data/datasources/local/database_helper.dart';
import 'package:flash_card/data/models/quiz_answer_model.dart';
import 'package:sqflite/sqflite.dart';

class QuizAnswerDao {
  final dbHelper = DatabaseHelper();

  Future<void> insertQuizAnswer(QuizAnswerModel answer) async {
    final db = await dbHelper.database;
    await db.insert(
      'quiz_answers',
      answer.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> getQuizAnswerByLevelId(int levelId) async {
    final db = await dbHelper.database;
    await db.query('quiz_answers');
  }
}
