import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _NavegationModel(),
      child: Scaffold(
        body: _Pages(),
        bottomNavigationBar: _Navegation(),
      ),
    );
  }
}

class _Navegation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //En el context esta el provider
    final navegationModel = Provider.of<_NavegationModel>(
        context); //Instancia de la clase _NavegationModel que se encuentra en el context de la App.

    return BottomNavigationBar(
      //Cambiar la opción seleccionada.
      currentIndex: navegationModel.pageActual,
      onTap: (i) => navegationModel.pageActual = i, //Se le pasa el valor.
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Para ti',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.public),
          label: 'Encabezados',
        ),
      ],
    );
  }
}

class _Pages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegationModel = Provider.of<_NavegationModel>(context);

    return PageView(
      controller: navegationModel.pageController,
      physics: NeverScrollableScrollPhysics(), //Inhabilita la fisica del scroll
      children: [
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.yellow,
        )
      ],
    );
  }
}

//Provider para informarle a los Widgets.
class _NavegationModel with ChangeNotifier {
  int _pageActual = 0;
  PageController _pageController =
      new PageController(); //Controlador para cambiar las paginas.

  int get pageActual => this._pageActual;
  set pageActual(int value) {
    this._pageActual = value;
    _pageController.animateToPage(
      //Se invoca al controlador para actualizar el page.
      value,
      duration: Duration(milliseconds: 250),
      curve: Curves.easeInOut,
    );
    //Ejecuta un precdimiento para informarle a los widgets y se redibujen.
    notifyListeners();
  }

  PageController get pageController => this._pageController; //Get
}
