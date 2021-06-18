import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:news/src/models/category_model.dart';
import 'package:news/src/models/news_models.dart';
import 'package:http/http.dart' as http;

class NewsServices with ChangeNotifier {
  final _apiKey = '';
  final _urlNews = 'newsapi.org';
  //NewsServices en la parte mas alta del arbol de widgets, para ser accesible en toda la App.
  List<Article> headlines = []; //Lista de articulos.
  final DateTime _now = DateTime.now();
  String _selectedCategoty = 'business';

  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.volleyballBall, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];

  bool _isLoading = true;

  //Mapa apuntando a un listado para manejar la información en cache de la App.
  Map<String, List<Article>> categoryArticules = {};

  //Llamados http.
  NewsServices() {
    categories.forEach((item) {
      //Barre el List.
      this.categoryArticules[item.name] = [];
    });

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
      'language': 'es',
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

  String get selectedCategory => this._selectedCategoty;
  set selectedCategory(String value) {
    this._selectedCategoty = value;
    this.getArticlesByCategory(value);
    notifyListeners(); //Notificar a los Listener la categoria seleccionada}
  }

  getArticlesByCategory(String category) async {
//Llamada Http.
//https://newsapi.org/v2/top-headlines?country=co&category=business&apiKey=0d1b87b909e6463b8f86bfd58013dc49

    if (this.categoryArticules[category]!.length > 0) {
      //this._isLoading = false;
      //notifyListeners();
      return this.categoryArticules[category];
    }

    //Generacion de la URL HTTPS
    final _uriS = Uri.https(_urlNews, 'v2/top-headlines', {
      'country': 'co',
      'category': category,
      'q': '', //'bitcoin',
      'apikey': _apiKey,
    });

    print(_uriS);

    final response = await http.get(_uriS);
    final newsResponse =
        newsResponsesFromJson(response.body); //json.decode(response.body);
    this.categoryArticules[category]!.addAll(newsResponse.articles);
    notifyListeners(); //Notifica a todos los listener.
  }
}
