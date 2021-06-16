import 'package:flutter/material.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Pages(),
      bottomNavigationBar: _Navegation(),
    );
  }
}

class _Navegation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      //Cambiar la opción seleccionada.
      currentIndex: 1,
      onTap: (i) => print('$i'),
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
    return PageView(
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

  int get pageActual => this._pageActual;
  set pageActual(int value) {
    this._pageActual = value;
    //Ejecuta un precdimiento para informarle a los widgets y se redibujen.
    notifyListeners();
  }
}
