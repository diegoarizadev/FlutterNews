import 'package:flutter/material.dart';
import 'package:news/src/pages/tabs_page.dart';
import 'package:news/src/services/news_services.dart';
import 'package:news/src/theme/darkThemeCustom.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      //Se envuelve en un multiprovider ya que la App, puede tener varios provider y que esten en la parte mas alta del arbol, para este caso el provider que necesitamos es NewsServices
      providers: [
        ChangeNotifierProvider(create: (_) => new NewsServices()),
      ],
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        home: TabsPage(),
        theme: myThemeDark, //Aplica un tema.
      ),
    );
  }
}
