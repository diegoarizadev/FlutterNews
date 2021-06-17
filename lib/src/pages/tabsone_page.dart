import 'package:flutter/material.dart';
import 'package:news/src/services/news_services.dart';
import 'package:provider/provider.dart';

class TabOnePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Obtener los TopHeadlines
    final newsServices = Provider.of<NewsServices>(context);
    return Scaffold(
      body: Center(
        child: Text('Hola Mundo'),
      ),
    );
  }
}
