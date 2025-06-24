import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flash_card/app/app_routers.dart';
import 'package:flash_card/core/functions/notification_fn.dart';
import 'package:flash_card/core/utils/app_dependency_injector.dart';
import 'package:flash_card/data/datasources/local/database_helper.dart';
import 'package:flash_card/data/datasources/local/vocalbulary_dao.dart';
import 'package:flash_card/data/models/vocabulary_model.dart';
import 'package:flash_card/presentation/pages/home/home_page.dart';
import 'package:flash_card/presentation/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  importVocabulariesFromAssets();
  await Firebase.initializeApp();
  settingNotiFication();
  listenerNotification();
  runApp(AppDependencyInjector(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: AppRouter.generateRoute,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.backgroundBodyColor,
        primaryColor: AppColors.primaryColor,
      ),
      home: HomePage(),
    );
  }
}

Future<void> importVocabulariesFromAssets() async {
  final db = await DatabaseHelper().database;
  await db.delete('vocabularies');

  final String data = await rootBundle.loadString('assets/vocabulary/vocabularies.json');
  final List<dynamic> jsonResult = jsonDecode(data);
  final dao = VocabularyDao();

  for (final item in jsonResult) {
    final vocab = VocabularyModel.fromJson(item);
    await dao.insertVocabulary(vocab);
  }
}

//---------- firebase notification section ---------//
listenerNotification() async {
  if (Platform.isAndroid) {
    await FirebaseMessaging.instance.setAutoInitEnabled(true);
  }

  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  await firebaseMessaging.requestPermission();
  await getToken();

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    if (message.notification != null) {
      var title = message.notification?.title ?? "";
      var description = message.notification?.body ?? "";
      NotificationFN.showSimpleNotification(title, description);
    }
  });
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print('Message clicked! ${message.messageId}');
  });
}

getToken() async {
  try {
    var token = await FirebaseMessaging.instance.getToken();
    log("token $token");
    print("token $token");
  } catch (e) {
    log("getToken Error $e");
  }
}

settingNotiFication() async {
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  final initSettingsAndroid = AndroidInitializationSettings(
    '@mipmap/ic_launcher',
  );

  InitializationSettings initializationSettings = InitializationSettings(
    android: initSettingsAndroid,
    // iOS: initializationSettingsIOS,
  );

  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse: (NotificationResponse response) {
      print('Notification clicked with payload: ${response.payload}');
    },
  );
}

//---------- end firebase notification section ---------//
