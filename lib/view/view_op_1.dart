import 'package:flutter/material.dart';
import 'package:flutter_prueba_tecnica/view/usuario/view_registrar.dart';
import 'package:flutter_prueba_tecnica/view/usuario/view_usuarios.dart';
import 'package:flutter_prueba_tecnica/widgets/custom_card.dart';

void main() => runApp(const Opcion1());

class Opcion1 extends StatelessWidget {
  const Opcion1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Opcion 1',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Opcion 1'),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CustomCard('Ver Usuarios', ViewUsuarios()),
                CustomCard('Registrar Usuario', RegistrarUsuario()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
