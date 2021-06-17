import 'package:flutter/material.dart';
import 'package:news/src/models/news_models.dart';

class NewsServices with ChangeNotifier {
  //NewsServices en la parte mas alta del arbol de widgets, para ser accesible en toda la App.
  List<Article> headline = []; //Lista de articulos.

  //Llamados http.
  NewsServices() {
    //Quedara de forma global en la App con un provider.
    this.getTopHeadLines();
  }

  getTopHeadLines() {
    print('Cargando Headlines');
  }
}
