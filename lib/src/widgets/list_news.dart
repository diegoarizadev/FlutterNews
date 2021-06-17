import 'package:flutter/material.dart';
import 'package:news/src/models/news_models.dart';

class LitsNews extends StatelessWidget {
  final List<Article> news;

  const LitsNews(this.news); //Constructor para solo trabajar con noticias.

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.news.length,
      itemBuilder: (BuildContext context, int index) {
        return Text(
          this.news[index].title,
          style: TextStyle(color: Colors.red),
        );
      },
    );
  }
}
