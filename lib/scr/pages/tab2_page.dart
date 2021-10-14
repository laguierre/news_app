import 'package:flutter/material.dart';
import 'package:news_app/scr/models/category_model.dart';
import 'package:news_app/scr/services/news_services.dart';
import 'package:news_app/scr/theme/theme.dart';
import 'package:news_app/scr/widgets/news_list.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  const Tab2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          _CategoryList(),
          if (!newsService.isLoading)
            Expanded(child: NewsList(newsService.getSelectedArticlesCategory!)),
          if (newsService.isLoading)
            Expanded(child: Center(child: CircularProgressIndicator()))
        ],
      ),
    ));
  }
}

class _CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsService>(context).categories;
    return Container(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index) {
            final cName = categories[index].name;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  _CategoryBtn(categories[index]),
                  const SizedBox(height: 5.0),
                  Text('${cName[0].toUpperCase()}${cName.substring(1)}'),
                ],
              ),
            );
          }),
    );
  }
}

class _CategoryBtn extends StatelessWidget {
  const _CategoryBtn(this.category);

  final Category category;

  @override
  Widget build(BuildContext context) {
    final newService = Provider.of<NewsService>(context);
    return GestureDetector(
      onTap: () {
        final newService = Provider.of<NewsService>(context, listen: false);
        newService.selectedCategory = category.name;
        //print('${category.name}');
      },
      child: Container(
        width: 40.0,
        height: 40.0,
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Icon(
          category.icon,
          color: newService.selectedCategory == category.name
              ? myTheme.colorScheme.secondary
              : Colors.black54,
        ),
      ),
    );
  }
}
