import 'package:flash_card/core/enums/level_vocab_enum.dart';
import 'package:flash_card/presentation/pages/flashcard/flashcard_page.dart';
import 'package:flash_card/presentation/pages/space_x/capsule/capsule_page.dart';
import 'package:flash_card/presentation/pages/space_x/space_x_main_menu.dart';
import 'package:flutter/material.dart';

class AppRouter {
  //space-x
  static const String mainMenuSpaceX = '/';
  static const String capsule = '/capsule';
  static const String company = '/company';

  //flash-card
  static const String flashCard = '/flash_card';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mainMenuSpaceX:
        return MaterialPageRoute(builder: (_) => SpaceXMainMenu());

      case capsule:
        return MaterialPageRoute(builder: (_) => CapsulePage());

      case flashCard:
        final args = settings.arguments as Map<String, dynamic>;
        var level = levelVocabIdToEnum(args['level_id']);
        return MaterialPageRoute(builder: (_) => FlashCardPage(level: level));

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
