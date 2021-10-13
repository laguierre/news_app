import 'package:flutter/material.dart';
import 'package:news_app/scr/services/news_services.dart';
import 'package:news_app/scr/widgets/news_list.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatefulWidget {
  const Tab1Page({Key? key}) : super(key: key);

  @override
  _Tab1PageState createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final headlines = Provider.of<NewsService>(context).headlines;

    return Scaffold(
      body: SafeArea(
        child: (headlines.length == 0)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : NewsList(headlines),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
