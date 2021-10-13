import 'package:flutter/material.dart';
import 'package:news_app/scr/pages/tab1_page.dart';
import 'package:news_app/scr/pages/tab2_page.dart';
import 'package:provider/provider.dart';

class TabPage extends StatelessWidget {
  const TabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _ModelNav(),
      child: const Scaffold(
        body: _Pages(),
        bottomNavigationBar: _BtnNav(),
      ),
    );
  }
}

class _BtnNav extends StatelessWidget {
  const _BtnNav({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final modelNav = Provider.of<_ModelNav>(context);

    return BottomNavigationBar(
      currentIndex: modelNav.page,
      onTap: (i) => modelNav.page = i,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outline), label: 'For you'),
        BottomNavigationBarItem(icon: Icon(Icons.public), label: 'Headers'),
      ],
    );
  }
}

class _Pages extends StatelessWidget {
  const _Pages({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final modelNav = Provider.of<_ModelNav>(context);
    return PageView(
      controller: modelNav.pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Tab1Page(),
        Tab2Page(),
      ],
    );
  }
}

class _ModelNav with ChangeNotifier {
  int _pag = 0;
  PageController _pageController = PageController();

  int get page => this._pag;

  set page(int page) {
    this._pag = page;
    _pageController.animateToPage(page,
        duration: Duration(milliseconds: 250), curve: Curves.easeInOut);
    notifyListeners();
  }

  PageController get pageController => this._pageController;
}
