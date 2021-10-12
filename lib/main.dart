import 'package:flutter/material.dart';
import 'package:news_app/scr/pages/tabs_page.dart';
import 'package:news_app/scr/services/news_services.dart';
import 'package:news_app/scr/theme/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'News Provider App',
        theme: myTheme,
        home: TabPage(),
      ),
    );
  }
}
