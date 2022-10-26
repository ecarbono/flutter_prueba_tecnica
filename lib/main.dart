import 'package:flutter/material.dart';

import 'package:flutter_prueba_tecnica/view/view_op_1.dart';
import 'package:flutter_prueba_tecnica/widgets/custom_card.dart';

void main() => runApp(const PruebaTecnica());

class PruebaTecnica extends StatelessWidget {
  const PruebaTecnica({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prueba Tecnica',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('PRUEBA TÉCNICA - FLUTTER DVP'),
          centerTitle: true,
          elevation: 0,
        ),
        body: const SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ExpansionTile(
                title: Text('Menu'),
                children: [
                  CustomCard('Opcion 1 prueba', Opcion1()),
                  //CustomCard('Opcion 2', Opcion2())
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
