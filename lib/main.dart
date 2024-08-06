import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guliva_clone/presentation/provider/login_state.dart';
import 'package:guliva_clone/presentation/provider/signup_state.dart';
import 'package:guliva_clone/presentation/screens/login_screen.dart';
import 'package:guliva_clone/presentation/theme/app_theme.dart';
import 'package:provider/provider.dart';


void main() async{
  await WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]); 
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => SignUpProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: myTheme,
      home: LoginScreen(),
    );
  }
}