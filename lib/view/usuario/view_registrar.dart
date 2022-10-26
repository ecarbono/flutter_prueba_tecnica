import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_prueba_tecnica/provider/variables.dart';
import 'package:flutter_prueba_tecnica/util/formulario_decoratior.dart';
import 'package:flutter_prueba_tecnica/util/isnumeric.dart';
import 'package:flutter_prueba_tecnica/util/text_style.dart';
import 'package:flutter_prueba_tecnica/viewmodel/usuario/viewmodel_usuario.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

class RegistrarUsuario extends StatefulWidget {
  const RegistrarUsuario({super.key});

  @override
  State<RegistrarUsuario> createState() => _RegistrarUsuarioState();
}

class _RegistrarUsuarioState extends State<RegistrarUsuario> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registrar usuario',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Registrar usuario'),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: ViewModelBuilder<ViewModelUsuario>.reactive(
          onModelReady: (view) => [
            view.loading(),
          ],
          viewModelBuilder: () => ViewModelUsuario(),
          builder: (context, model, child) {
            return Center(
              child: SingleChildScrollView(
                child: Form(
                  key: model.formulario,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Title(
                          color: colorTheme,
                          title: "Titulo",
                          child: Text(
                            "Formulario de registro",
                            style: textoStyle.copyWith(fontSize: 24),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 12),
                          child: TextFormField(
                            maxLength: 10,
                            cursorColor: colorTheme,
                            controller: model.controllerdocumento,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                fontSize: 18.0,
                                height: 1.5,
                                color: Colors.black),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Campo requerido*';
                              }
                              if (value.length < 10) {
                                return 'Digite una documento valido*';
                              }

                              return null;
                            },
                            decoration: formDeco.copyWith(
                              label: const Text("Documento identidad"),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 12),
                          child: TextFormField(
                            cursorColor: colorTheme,
                            controller: model.controllernombre,
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                fontSize: 18.0,
                                height: 1.5,
                                color: Colors.black),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Campo requerido*';
                              }
                              if (isNumeric(value)) {
                                return 'Solo se admite texto*';
                              }

                              return null;
                            },
                            decoration: formDeco.copyWith(
                              label: const Text("Nombre"),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 12),
                          child: TextFormField(
                            cursorColor: colorTheme,
                            controller: model.controllerapellido,
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                fontSize: 18.0,
                                height: 1.5,
                                color: Colors.black),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Campo requerido*';
                              }
                              if (isNumeric(value)) {
                                return 'Solo se admite texto*';
                              }
                              return null;
                            },
                            decoration: formDeco.copyWith(
                              label: const Text("Apellido"),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            DatePicker.showDatePicker(
                              context,
                              showTitleActions: true,
                              minTime: DateTime(1940, 01, 01), //yyyy/mm/dd
                              maxTime: DateTime(2022, 12, 31), //yyyy/mm/dd
                              theme: const DatePickerTheme(
                                backgroundColor: Colors.white,
                                itemStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                                doneStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                                cancelStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                              onConfirm: (date) {
                                model.controllerfechanacimiento.text =
                                    DateFormat('dd/MM/yyyy').format(date);
                              },
                              onCancel: () {
                                model.controllerfechanacimiento.text = "";
                              },
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 12),
                            child: TextFormField(
                              cursorColor: colorTheme,
                              controller: model.controllerfechanacimiento,
                              keyboardType: TextInputType.datetime,
                              textAlign: TextAlign.start,
                              enabled: false,
                              style: const TextStyle(
                                  fontSize: 18.0,
                                  height: 1.5,
                                  color: Colors.black),
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value == "") {
                                  return 'Campo requerido*';
                                }

                                return null;
                              },
                              decoration: formDeco.copyWith(
                                label: const Text("Fecha de nacimiento"),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          child: Column(
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const ScrollPhysics(),
                                itemCount: model.listbool.length,
                                itemBuilder: (BuildContext context, int index) {
                                  model.direcList.add(TextEditingController());
                                  return Visibility(
                                    visible: model.listbool[index],
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 6),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                              cursorColor: colorTheme,
                                              controller:
                                                  model.direcList[index],
                                              keyboardType:
                                                  TextInputType.streetAddress,
                                              textAlign: TextAlign.start,
                                              style: const TextStyle(
                                                fontSize: 18.0,
                                                height: 1.5,
                                                color: Colors.black,
                                              ),
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Campo requerido*';
                                                }

                                                return null;
                                              },
                                              decoration: formDeco.copyWith(
                                                label: Text(
                                                    "Dirección ${index + 1}"),
                                              ),
                                            ),
                                          ),
                                          Visibility(
                                            visible: true,
                                            child: InkWell(
                                              onTap: () {
                                                model.addordelete(
                                                    addor: (index <
                                                        model.listbool.length -
                                                            1),
                                                    index: index);
                                              },
                                              child: Visibility(
                                                visible:
                                                    (model.listbool[index] ==
                                                        true),
                                                child: Container(
                                                  width: 30,
                                                  height: 30,
                                                  margin: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10),
                                                  decoration: BoxDecoration(
                                                    color: (index <
                                                            model.listbool
                                                                    .length -
                                                                1)
                                                        ? Colors.green
                                                        : Colors.red,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  child: Icon(
                                                    (index <
                                                            model.listbool
                                                                    .length -
                                                                1)
                                                        ? Icons.add
                                                        : Icons.remove,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Visibility(
                                            visible: (index > 0 && index < 2),
                                            child: InkWell(
                                              onTap: () {
                                                model.addordelete(
                                                    addor: !(index > 0 &&
                                                        index < 3),
                                                    index: index);
                                              },
                                              child: Container(
                                                width: 30,
                                                height: 30,
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                decoration: BoxDecoration(
                                                  color:
                                                      (index > 0 && index < 3)
                                                          ? Colors.red
                                                          : Colors.green,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Icon(
                                                  (index > 0 && index < 3)
                                                      ? Icons.remove
                                                      : Icons.add,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                              // Container(
                              //   child: Row(
                              //     crossAxisAlignment: CrossAxisAlignment.center,
                              //     mainAxisAlignment: MainAxisAlignment.center,
                              //     children: [
                              //       InkWell(
                              //         onTap: () {
                              //           model.addordelete(addor: false);
                              //         },
                              //         child: Container(
                              //           width: 30,
                              //           height: 30,
                              //           margin: const EdgeInsets.symmetric(
                              //               horizontal: 10),
                              //           decoration: BoxDecoration(
                              //             color: Colors.red,
                              //             borderRadius:
                              //                 BorderRadius.circular(20),
                              //           ),
                              //           child: const Icon(
                              //             Icons.remove,
                              //             color: Colors.white,
                              //           ),
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // )
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            model.registrarusuario();
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size.fromHeight(50),
                            primary: colorTheme,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                color: Colors.blue,
                                width: 1,
                                style: BorderStyle.solid,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            textStyle:
                                const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          child: Text(
                            'Registrar',
                            style: textoStyle.copyWith(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
