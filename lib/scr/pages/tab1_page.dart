import 'package:flutter/material.dart';
import 'package:news_app/scr/services/news_services.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatelessWidget {
  const Tab1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newService = Provider.of<NewsService>(context);
    return Scaffold(
      body: Center(),
    );
  }
}
