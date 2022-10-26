import 'package:flutter/material.dart';
import 'package:flutter_prueba_tecnica/model/model_result.dart';
import 'package:flutter_prueba_tecnica/model/model_user.dart';
import 'package:flutter_prueba_tecnica/provider/variables.dart';
import 'package:flutter_prueba_tecnica/util/formulario_decoratior.dart';
import 'package:flutter_prueba_tecnica/widgets/widget_toast.dart';

class ViewModelUsuario extends ChangeNotifier {
  final GlobalKey<FormState> formulario = GlobalKey<FormState>();
  TextEditingController controllerdocumento = TextEditingController(text: "");
  TextEditingController controllernombre = TextEditingController(text: "");
  TextEditingController controllerapellido = TextEditingController(text: "");
  TextEditingController controllerfechanacimiento =
      TextEditingController(text: "");
  TextEditingController controllerdireccion = TextEditingController(text: "");
  TextEditingController controllerdireccion2 = TextEditingController(text: "");
  TextEditingController controllerdireccion3 = TextEditingController(text: "");
  int contador = 0;
  List<Widget> direcTextFieldsList = [];
  List<TextEditingController> direcList = [];
  List<bool> listbool = [];
  List<Usuario> usuarios = [];
  registrarusuario() async {
    if (formulario.currentState!.validate()) {
      Usuario usuariofinal = Usuario(
        docuemnto: controllerdocumento.text,
        apellido: controllerapellido.text,
        nombre: controllernombre.text,
        fechanacimiento: controllerfechanacimiento.text,
        direccion_1: direcList[0].text,
        direccion_2: direcList[1].text,
        direccion_3: direcList[2].text,
      );
      Result result =
          await Usuario().postRegustrarUsuario(usuario: usuariofinal);
      if (result.error == 1) {
        await MyToast().getDialog(
            mensaje: "Señor usuario, ha ocurrido un error", color: Colors.red);
      }
      if (result.error == 0) {
        await MyToast()
            .getDialog(mensaje: "Registro exito!", color: Colors.green);
      }
    }
  }

  cargarUsuarios() async {
    usuarios = await Usuario().getUsuarios();
    notifyListeners();
    return usuarios;
  }

  List<Widget> widgetDireccion() {
    direcTextFieldsList.clear();

    listbool[0] = true;

    for (int i = 0; i < listbool.length; i++) {
      direcTextFieldsList.add(Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            Visibility(
              visible: listbool[i],
              child: Expanded(
                child: TextFormField(
                  cursorColor: colorTheme,
                  controller: direcList[i],
                  keyboardType: TextInputType.streetAddress,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 18.0,
                    height: 1.5,
                    color: Colors.black,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo requerido*';
                    }

                    return null;
                  },
                  decoration: formDeco.copyWith(
                    label: Text("Dirección ${i + 1}"),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: listbool[i],
              child: addRemoveButton(false, i),
            )
          ],
        ),
      ));
    }
    return direcTextFieldsList;
  }

  loading() {
    direcList.add(controllerdireccion);
    direcList.add(controllerdireccion2);
    direcList.add(controllerdireccion3);
    listbool = List<bool>.filled(direcList.length, false);

    listbool[0] = true;
  }

  addordelete({required bool addor, required int index}) {
    if (addor) {
      if (index == listbool.length - 1) {
        listbool[index] = false;
        direcList[index].text = "";
      } else {
        listbool[index + 1] = true;
      }
    } else {
      if (index == 1 && listbool[2] == true) {
        direcList[index].text = direcList[index + 1].text;
        listbool[index + 1] = false;
        direcList[index + 1].text = "";
      } else {
        listbool[index] = false;
        direcList[index].text = "";
      }
    }
    notifyListeners();
  }

  addAddres(
    bool? add,
    int index,
  ) {
    if (index == 0) {
      // if (index == 0) {
      //   // direcList.insert(index, controllerdireccion2);
      //   direcList.add(controllerdireccion2);
      // } else if (index == 1) {
      //   // direcList.insert(index, controllerdireccion3);
      //   direcList.add(controllerdireccion3);
      // }

    } else {
      // direcTextFieldsList.removeAt(index);
      // direcList.removeAt(index);
      // direcList[index] = TextEditingController(text: "");
    }
    // direcList.sort((a, b) => b.text.compareTo(a.text));

    notifyListeners();
  }

  Widget addRemoveButton(bool add, int index) {
    return InkWell(
      onTap: () {
        addAddres(add, index);
        notifyListeners();
      },
      child: Container(
        width: 30,
        height: 30,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: (index == 2)
            ? BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
              )
            : BoxDecoration(
                color: (listbool[index]) ? Colors.green : Colors.red,
                borderRadius: BorderRadius.circular(20),
              ),
        child: Icon(
          (listbool[index]) ? Icons.add : Icons.remove,
          color: Colors.white,
        ),
      ),
    );
  }
}
