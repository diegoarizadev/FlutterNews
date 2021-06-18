import 'package:flutter/material.dart';
import 'package:news/src/models/category_model.dart';
import 'package:news/src/services/news_services.dart';
import 'package:provider/provider.dart';

class TabTwoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Obtener los TopHeadlines
    //final newsServices = Provider.of<NewsServices>(context); //Obtener los Topheadlines del arbol de Widgets
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          _ListCategories(),
        ],
      )),
    );
  }
}

class _ListCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsServices>(context)
        .categories; //Se obtiene el listado de las categorias.
    return Container(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          final nameCategory = categories[index].name;
          return Container(
            width: 110,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  _CategoryButton(
                    category: categories[index],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                      '${nameCategory[0].toUpperCase()}${nameCategory.substring(1)}')
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  final Category category;

  const _CategoryButton({required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final newsServices = Provider.of<NewsServices>(context,
            listen:
                false); //Cuando se encuentra en un evento OnTap, va listen: false.

        newsServices.selectedCategory = category.name;
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Icon(
          category.icon,
          color: Colors.black54,
        ),
      ),
    );
  }
}
