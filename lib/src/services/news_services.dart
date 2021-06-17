import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news/src/models/news_models.dart';
import 'package:http/http.dart' as http;

class NewsServices with ChangeNotifier {
  final _apiKey = '';
  final _urlNews = 'newsapi.org';
  //NewsServices en la parte mas alta del arbol de widgets, para ser accesible en toda la App.
  List<Article> headlines = []; //Lista de articulos.
  final DateTime _now = DateTime.now();

  //Llamados http.
  NewsServices() {
    //Quedara de forma global en la App con un provider.
    this.getTopHeadLines();
  }

  getTopHeadLines() async {
    //Llamada Http.

    //Generacion de la URL HTTPS
    final _uriS = Uri.https(_urlNews, 'v2/everything', {
      'q': 'bitcoin',
      'from': DateFormat('yyyy-MM-dd')
          .format(DateTime(_now.year, _now.month, _now.day - 1)),
      'to': DateFormat('yyyy-MM-dd').format(_now),
      'sortBy': 'popularity',
      'apikey': _apiKey,
    });

    print(_uriS);

    final response = await http.get(_uriS);
    final newsResponse =
        newsResponsesFromJson(response.body); //json.decode(response.body);

    this.headlines.addAll(newsResponse.articles);

    notifyListeners(); //Notifica a todos los listener.
  }
}
