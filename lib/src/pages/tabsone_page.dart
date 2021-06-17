import 'package:flutter/material.dart';
import 'package:news/src/services/news_services.dart';
import 'package:news/src/theme/darkThemeCustom.dart';
import 'package:news/src/widgets/list_news.dart';
import 'package:provider/provider.dart';

class TabOnePage extends StatefulWidget {
  @override
  _TabOnePageState createState() => _TabOnePageState();
}

class _TabOnePageState extends State<TabOnePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    //Obtener los TopHeadlines
    final newsServices = Provider.of<NewsServices>(
        context); //Obtener los Topheadlines del arbol de Widgets
    //newsServices.headlines

    return Scaffold(
      body: (newsServices.headlines.length == 0)
          ? Center(
              child: CircularProgressIndicator(
                color: myThemeDark.accentColor,
              ),
            )
          : LitsNews(newsServices.headlines),
    );
  }

  @override
  bool get wantKeepAlive =>
      true; //Mantiene el estado del scroll o el mismo lugar donde quedo el usuario
}
