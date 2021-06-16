import 'package:flutter/material.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
      physics:
          BouncingScrollPhysics(), //efecto de transición igual en IOS y Android.
      children: [
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.yellow,
        )
      ],
    ));
  }
}
