import 'package:flutter/material.dart';
import 'package:flutter_prueba_tecnica/viewmodel/usuario/viewmodel_usuario.dart';
import 'package:stacked/stacked.dart';

class ViewUsuarios extends StatelessWidget {
  const ViewUsuarios({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Usuarios',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Usuarios Registrados'),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: ViewModelBuilder<ViewModelUsuario>.reactive(
            onModelReady: (view) => [
                  view.cargarUsuarios(),
                ],
            viewModelBuilder: () => ViewModelUsuario(),
            builder: (context, model, child) {
              return SingleChildScrollView(
                  child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: model.usuarios.length,
                    itemBuilder: (BuildContext context, int index) {
                      model.direcList.add(TextEditingController());
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  color: Colors.white, width: 1.0),
                              borderRadius: BorderRadius.circular(10.0)),
                          color: Colors.white,
                          child: ListTile(
                            title:
                                Text("Nombre: ${model.usuarios[index].nombre}"),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "Apellido: ${model.usuarios[index].apellido}"),
                                Text(
                                    "Fecha Nacimiento: ${model.usuarios[index].fechanacimiento}"),
                                Text(
                                    "Direcci??n 1: ${model.usuarios[index].direccion_1}"),
                                Text(
                                    "Direcci??n 2: ${model.usuarios[index].direccion_2}"),
                                Text(
                                    "Direcci??n 3: ${model.usuarios[index].direccion_3}"),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ));
            }),
      ),
    );
  }
}
