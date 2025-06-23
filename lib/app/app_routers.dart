import 'package:flash_card/presentation/pages/space_x/capsule/capsule_page.dart';
import 'package:flash_card/presentation/pages/space_x/space_x_main_menu.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const String mainMenuSpaceX = '/';
  static const String capsule = '/capsule';
  static const String company = '/company';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mainMenuSpaceX:
        return MaterialPageRoute(builder: (_) => SpaceXMainMenu());

      case capsule:
        return MaterialPageRoute(builder: (_) => CapsulePage());

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
