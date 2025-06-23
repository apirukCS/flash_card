import 'package:flash_card/app/app_routers.dart';
import 'package:flash_card/core/constants/app_variables.dart';
import 'package:flash_card/presentation/widgets/texts/app_large_text.dart';
import 'package:flutter/material.dart';

class SpaceXMainMenu extends StatelessWidget {
  const SpaceXMainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(normalSpace),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                menu("Capsule", () => goToCapsulePage(context)),
                SizedBox(width: normalSpace),
                menu("Company", () => goToCompanyPage(context)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  goToCapsulePage(BuildContext context) {
    Navigator.pushNamed(context, AppRouter.capsule);
  }

  goToCompanyPage(BuildContext context) {
    Navigator.pushNamed(context, AppRouter.company);
  }

  menu(String text, Function() onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 80,
          color: const Color.fromARGB(255, 109, 168, 215),
          child: Center(child: AppLargeText(text: text)),
        ),
      ),
    );
  }
}
