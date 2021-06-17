import 'package:flutter/material.dart';
import 'package:news/src/models/news_models.dart';
import 'package:news/src/theme/darkThemeCustom.dart';

class LitsNews extends StatelessWidget {
  final List<Article> news;

  const LitsNews(this.news); //Constructor para solo trabajar con noticias.

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.news.length,
      itemBuilder: (BuildContext context, int index) {
        return _news(
          article: this.news[index],
          index: index,
        );
      },
    );
  }
}

class _news extends StatelessWidget {
  final Article article;
  final int index;

  const _news({
    required this.article,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CardTopBar(
          article: this.article,
          index: this.index,
        ),
        _CardTitle(
          article: this.article,
        ),
        _CardImage(
          article: this.article,
        ),
      ],
    );
  }
}

class _CardTopBar extends StatelessWidget {
  final Article article;
  final int index;

  const _CardTopBar({
    required this.article,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(
            '${index + 1}. ',
            style: TextStyle(color: myThemeDark.accentColor),
          ),
          Text(
            '${article.source!.name}. ',
          ),
        ],
      ),
    );
  }
}

class _CardTitle extends StatelessWidget {
  final Article article;

  const _CardTitle({required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Text(
        article.title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _CardImage extends StatelessWidget {
  final Article article;

  const _CardImage({required this.article});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Espacio para la imagen'),
    );
  }
}
