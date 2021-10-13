import 'package:flutter/material.dart';
import 'package:news_app/scr/models/news_models.dart';
import 'package:news_app/scr/theme/theme.dart';

class NewsList extends StatelessWidget {
  final List<Article> news;

  const NewsList(this.news);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: news.length,
        itemBuilder: (BuildContext context, int index) {
          return _News(news[index], index);
        });
  }
}

class _News extends StatelessWidget {
  const _News(@required this.news, @required this.index);

  final Article news;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TopBarCard(news, index),
        _TitleCard(news),
        _PictureCard(news),
        _BodyCard(news),
        _BtnCard(),
        const SizedBox(height: 10.0),
        const Divider(),
      ],
    );
  }
}

class _BtnCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RawMaterialButton(
              fillColor: myTheme.colorScheme.secondary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: const Icon(Icons.star_border),
              onPressed: () {}),
          const SizedBox(width: 10.0),
          RawMaterialButton(
              fillColor: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: const Icon(Icons.more),
              onPressed: () {}),
        ],
      ),
    );
  }
}

class _BodyCard extends StatelessWidget {
  const _BodyCard(this.news);

  final Article news;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          news.description != null ? news.description : '',
        ));
  }
}

class _PictureCard extends StatelessWidget {
  const _PictureCard(this.news);

  final Article news;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        child: Container(
            child: (news.urlToImage != null)
                ? FadeInImage(
                    placeholder:
                        const AssetImage('lib/assets/images/giphy.gif'),
                    image: NetworkImage(news.urlToImage!),
                  )
                : const Image(
                    image: AssetImage('lib/assets/images/no-image.png'))),
      ),
    );
  }
}

class _TitleCard extends StatelessWidget {
  const _TitleCard(this.news);

  final Article news;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Text(
        news.title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _TopBarCard extends StatelessWidget {
  const _TopBarCard(this.news, this.index);

  final Article news;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      margin: EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          Text(
            '${index + 1}. ',
            style: TextStyle(color: myTheme.colorScheme.secondary),
          ),
          Text(
            '${news.source.name}. ',
          ),
        ],
      ),
    );
  }
}
