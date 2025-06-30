import 'package:flash_card/core/enums/level_vocab_enum.dart';
import 'package:flash_card/presentation/pages/flashcard/flashcard_page.dart';
import 'package:flash_card/presentation/pages/home/home_page.dart';
import 'package:flash_card/presentation/pages/quiz/quiz_page.dart';
import 'package:flash_card/presentation/pages/quiz/result_page.dart';
import 'package:flash_card/presentation/pages/space_x/capsule/capsule_page.dart';
import 'package:flash_card/presentation/pages/space_x/space_x_main_menu.dart';
import 'package:flutter/material.dart';

class AppRouter {
  //space-x
  static const String mainMenuSpaceX = '/';
  static const String capsule = '/capsule';
  static const String company = '/company';

  //flash-card
  static const String home = '/home';
  static const String flashCard = '/flash_card';
  static const String quiz = '/quiz';
  static const String result = '/result';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => HomePage());

      case mainMenuSpaceX:
        return MaterialPageRoute(builder: (_) => SpaceXMainMenu());

      case capsule:
        return MaterialPageRoute(builder: (_) => CapsulePage());

      case flashCard:
        final args = settings.arguments as Map<String, dynamic>;
        var level = levelVocabIdToEnum(args['level_id']);
        return MaterialPageRoute(builder: (_) => FlashCardPage(level: level));

      case quiz:
        final args = settings.arguments as Map<String, dynamic>;
        var level = levelVocabIdToEnum(args['level_id']);
        return MaterialPageRoute(builder: (_) => QuizPage(level: level));

      case result:
        final args = settings.arguments as Map<String, dynamic>;
        var level = levelVocabIdToEnum(args['level_id']);
        return MaterialPageRoute(builder: (_) => ResultPage(level: level));

      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(child: Text('Page not found: ${settings.name}')),
              ),
        );
    }
  }
}
