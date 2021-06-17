import 'package:flutter/material.dart';
import 'package:news/src/services/news_services.dart';
import 'package:news/src/widgets/list_news.dart';
import 'package:provider/provider.dart';

class TabOnePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Obtener los TopHeadlines
    final newsServices = Provider.of<NewsServices>(
        context); //Obtener los Topheadlines del arbol de Widgets
    //newsServices.headlines
    return Scaffold(
      body: LitsNews(newsServices.headlines),
    );
  }
}
