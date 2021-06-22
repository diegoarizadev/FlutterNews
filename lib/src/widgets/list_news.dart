import 'package:flutter/material.dart';
import 'package:news/src/models/news_models.dart';
import 'package:news/src/theme/darkThemeCustom.dart';

class ListNews extends StatelessWidget {
  final List<Article> news;

  const ListNews(this.news); //Constructor para solo trabajar con noticias.

  @override
  Widget build(BuildContext context) {
    print('LitsNews - this.news!.length ; ${this.news.length}');
    return ListView.builder(
      itemCount: this.news.length, //this.news!.length,
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
        // _CardTopBar(
        //   article: this.article,
        //   index: this.index,
        // ),
        // _CardTitle(
        //   article: this.article,
        // ),
        // _CardImage(
        //   article: this.article,
        // ),
        // _CardBody(
        //   article: this.article,
        // ),
        // _CardBotton(),
        // SizedBox(
        //   height: 10,
        // ),
        // Divider(),
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
            '${article.source.name}. ',
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
    print('_CardTitle - article.title, ; ${article.title}');
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
    print('_CardImage - article.urlToImage ; ${article.urlToImage}');
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50.0),
          bottomRight: Radius.circular(50.0),
        ),
        child: Container(
          child: (article.urlToImage != null)
              ? FadeInImage(
                  placeholder: AssetImage('assets/giphy.gif'),
                  image: NetworkImage(article.urlToImage),
                )
              : Image(
                  image: AssetImage(
                    'assets/no-image.png',
                  ),
                ),
        ),
      ),
    );
  }
}

class _CardBody extends StatelessWidget {
  final Article article;

  const _CardBody({required this.article});
  @override
  Widget build(BuildContext context) {
    print('_CardBody - article.description : ${article.description}');
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text((article.description != null) ? article.description : ''));
  }
}

class _CardBotton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('_CardBotton - ');
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RawMaterialButton(
            child: Icon(Icons.star_border),
            onPressed: () {},
            fillColor: myThemeDark.colorScheme.secondary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          RawMaterialButton(
            child: Icon(Icons.more),
            onPressed: () {},
            fillColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ],
      ),
    );
  }
}
