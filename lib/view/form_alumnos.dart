import 'package:colegio_app/controller/todo_controller.dart';
import 'package:colegio_app/model/alumnos.dart';
import 'package:colegio_app/model/colors.dart';
import 'package:colegio_app/repository/alumno_repository.dart';
import 'package:colegio_app/repository/todo_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class FormAlumnos extends StatefulWidget {
  const FormAlumnos({Key? key}) : super(key: key);

  @override
  _FormAlumnosState createState() => _FormAlumnosState();
}

class _FormAlumnosState extends State<FormAlumnos> {
  var alumnoWebRepo = AlumnoWebRepository();

  final nombres = TextEditingController();
  final apPaterno = TextEditingController();
  final apMaterno = TextEditingController();
  final sexo = TextEditingController();
  final nroDni = TextEditingController();
  final fechaNacimiento = TextEditingController();
  final telefono = TextEditingController();
  final email = TextEditingController();
  final datosPadre = TextEditingController();
  final datosMadre = TextEditingController();
  final direccion = TextEditingController();
  final String user = "";
  final List<String> pass = []; //probando

  Dio dio = new Dio();

  Future addPublication() async {
    final String pathUrl =
        'https://us-central1-sistema-colegio-4a695.cloudfunctions.net/app/alumnos';
    dynamic data = {
      'nombres': nombres.text,
      'apellidoPaterno': apPaterno.text,
      'apellidoMaterno': apMaterno.text,
      'fechaNacimiento': '01/01/2022',
      'dni': nroDni.text,
      // 'j': '',
      // 'nombreDelaMadre': 'madre',
      'telefonoApoderado': '996565437',
    };

    print('data: $data');

    var response = await dio.post(pathUrl,
        data: data,
        options: Options(
            headers: {'Content-type': 'application/json; charset=UTF-8'}));
    return response.data;
  }

  @override
  void dispose() {
    nombres.dispose();
    apPaterno.dispose();
    apMaterno.dispose();
    sexo.dispose();
    nroDni.dispose();
    fechaNacimiento.dispose();
    telefono.dispose();
    email.dispose();
    datosPadre.dispose();
    datosMadre.dispose();
    direccion.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Agregar Alumno',
            style: TextStyle(color: ColorsSchool.fourthColor,fontSize: 25),
          ),
          backgroundColor: ColorsSchool.secondaryColor,
        ),
        // backgroundColor: ColorsSchool.secondaryColor,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              // Colors.black,
              // Colors.black54,
              // Colors.black26,
              Colors.white30,
              Colors.white10,
            ],
          )),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    // padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                    padding: EdgeInsets.only(left: 50.0, right: 50.0, top: 10, bottom: 0),
                    child:
                        widgetTextField(nombres, 'nombres', 'Ingrese nombre'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 50.0, right: 50.0, top: 10, bottom: 0),
                    // padding: EdgeInsets.symmetric(horizontal: 65),
                    child: widgetTextField(
                        apPaterno, 'A. Paterno', 'Ingrese apellido paterno'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 50.0, right: 50.0, top: 10, bottom: 0),
                    // padding: EdgeInsets.symmetric(horizontal: 65),
                    child: widgetTextField(
                        apMaterno, 'A. Materno', 'Ingrese nombre'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 50.0, right: 50.0, top: 10, bottom: 0),
                    // padding: EdgeInsets.symmetric(horizontal: 65),
                    child: widgetTextField(sexo, 'genero', 'Ingrese nombre'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 50.0, right: 50.0, top: 10, bottom: 0),
                    // padding: EdgeInsets.symmetric(horizontal: 65),
                    child: widgetTextField(nroDni, 'DNI', 'Ingrese nombre'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 50.0, right: 50.0, top: 10, bottom: 0),
                    // padding: EdgeInsets.symmetric(horizontal: 65),
                    child: widgetTextField(
                        fechaNacimiento, 'Fecha Ncto.', 'Ingrese nombre'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 50.0, right: 50.0, top: 10, bottom: 0),
                    // padding: EdgeInsets.symmetric(horizontal: 65),
                    child:
                        widgetTextField(telefono, 'Telefono', 'Ingrese nombre'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 50.0, right: 50.0, top: 10, bottom: 0),
                    // padding: EdgeInsets.symmetric(horizontal: 65),
                    child: widgetTextField(email, 'Email', 'Ingrese nombre'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 50.0, right: 50.0, top: 10, bottom: 10),
                    // padding: EdgeInsets.symmetric(horizontal: 65),
                    child: widgetTextField(
                        direccion, 'Direccion', 'Ingrese nombre'),
                  ),
                  Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                      color: ColorsSchool.secondaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: FlatButton(
                      onPressed: () async {
                        Alumno alumn = Alumno(
                            nombres: nombres.text,
                            apellidoPaterno: apPaterno.text,
                            apellidoMaterno: apMaterno.text,
                            sexo: sexo.text,
                            dni: nroDni.text,
                            fechaNacimiento: fechaNacimiento.text,
                            celular: telefono.text,
                            email: email.text,
                            datosDelPadre: '',
                            datosDelaMadre: '',
                            direccion: direccion.text);
                        alumnoWebRepo.addAlumno(alumn);
                        // await addPublication().then((value) => print(value));
                      },
                      child: Text(
                        'Agregar',
                        style: TextStyle(color: ColorsSchool.fifthColor, fontSize: 20),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text('Ingrese todos los campos')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextField widgetTextField(controller, String label, String placeholder) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          // border: OutlineInputBorder(),
          labelText: label,
          hintText: placeholder
      ),
    );
  }
}
