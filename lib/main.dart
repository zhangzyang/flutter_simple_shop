import 'package:demo1/constant/color.dart';
import 'package:demo1/provider/providers.dart';
import 'package:demo1/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:nav_router/nav_router.dart';
import 'package:provider/provider.dart';

import './app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: Consumer<UserProvider>(
        builder: (context, userProvider, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: '典典小卖部',
          theme: myDefaultTheme,
          home: new App(),
          navigatorKey: navGK,
        ),
      ),
    );
  }
}

//自定义主题,绿色小清新风格
final ThemeData myDefaultTheme = new ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Color(0xFFebebeb),
    cardColor: Colors.green);
