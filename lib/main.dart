import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water_quality/controller/provider/report_provider.dart';
import 'package:water_quality/screen/pages/login_screen.dart';
import 'controller/provider/account_provider.dart';
import 'controller/provider/experiment_provide.dart';
import 'controller/provider/notification_provider.dart';
import 'controller/provider/setting_provider.dart';
import 'firebase_potions.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>NotificationProvider()),
        ChangeNotifierProvider(create: (context)=>AccountProvider()),
        ChangeNotifierProvider(create: (context)=>ExperimentProvider()),
        ChangeNotifierProvider(create: (context)=>SettingProvider()),
        ChangeNotifierProvider(create: (context)=>ReportProvider())
      ],
    child: 
      const MaterialApp(
        title: 'Water Quality',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    ));
  }
}
