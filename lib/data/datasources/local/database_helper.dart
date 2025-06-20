import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'flashcard.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE vocabularies (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        level_id INTEGER NOT NULL,
        front_text TEXT NOT NULL,
        back_text TEXT NOT NULL,
        pronunciation TEXT,
        example_sentence TEXT,
        difficulty INTEGER DEFAULT 1,
        created_at TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE user_progress (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        vocabulary_id INTEGER NOT NULL,
        user_id TEXT DEFAULT 'default_user',
        is_memorized BOOLEAN DEFAULT FALSE,
        review_count INTEGER DEFAULT 0,
        last_reviewed TEXT,
        next_review TEXT,
        difficulty_level INTEGER DEFAULT 1,
        streak_count INTEGER DEFAULT 0,
        UNIQUE(vocabulary_id, user_id)
      )
    ''');
  }
}
