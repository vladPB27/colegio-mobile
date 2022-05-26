import 'package:colegio_app/model/alumnos.dart';
import 'package:colegio_app/model/colors.dart';
import 'package:colegio_app/repository/alumno_repository.dart';
import 'package:colegio_app/view/alumnos/alumnos_lista.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class FormAlumnos extends StatefulWidget {

  final Alumno? dataAlumno;
  const FormAlumnos(this.dataAlumno,{Key? key}) : super(key: key);

  @override
  _FormAlumnosState createState() => _FormAlumnosState();
}

class _FormAlumnosState extends State<FormAlumnos> {

  @override
  void initState() {
    getDataUpdateStudent();

    super.initState();
  }
  var alumnoWebRepo = AlumnoWebRepository();

  TextEditingController nombres = TextEditingController();
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

  agregar() async{
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
  }

  actualizar() async{
    Alumno alumn = Alumno(
        id: widget.dataAlumno!.id,
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
    print('enviando: ${alumn.id}');
    alumnoWebRepo.updateAlumno(alumn);
  }

  getDataUpdateStudent(){
    if(widget.dataAlumno != null){
      print('DATOS: ${widget.dataAlumno!.toJson()}');
      nombres.text = '${widget.dataAlumno!.nombres}';
      apPaterno.text = '${widget.dataAlumno!.apellidoPaterno}';
      apMaterno.text = '${widget.dataAlumno!.apellidoMaterno}';
      sexo.text = '${widget.dataAlumno!.sexo}';
      nroDni.text = '${widget.dataAlumno!.dni}';
      fechaNacimiento.text = '${widget.dataAlumno!.fechaNacimiento}';
      telefono.text = '${widget.dataAlumno!.celular}';
      email.text = '${widget.dataAlumno!.email}';
      direccion.text = '${widget.dataAlumno!.direccion}';
    }else{
      print('NULL');
    }
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
          backgroundColor: ColorsSchool.primaryColor,
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
                        widgetTextField(nombres, 'nombres', 'Ingrese nombre',Icons.perm_identity_outlined),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 50.0, right: 50.0, top: 10, bottom: 0),
                    // padding: EdgeInsets.symmetric(horizontal: 65),
                    child: widgetTextField(
                        apPaterno, 'A. Paterno', 'Ingrese apellido paterno',Icons.perm_identity_outlined),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 50.0, right: 50.0, top: 10, bottom: 0),
                    // padding: EdgeInsets.symmetric(horizontal: 65),
                    child: widgetTextField(
                        apMaterno, 'A. Materno', 'Ingrese nombre',Icons.perm_identity_outlined),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 50.0, right: 50.0, top: 10, bottom: 0),
                    // padding: EdgeInsets.symmetric(horizontal: 65),
                    child: widgetTextField(sexo, 'genero', 'Ingrese nombre',Icons.wc_outlined),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 50.0, right: 50.0, top: 10, bottom: 0),
                    // padding: EdgeInsets.symmetric(horizontal: 65),
                    child: widgetTextField(nroDni, 'DNI', 'Ingrese nombre',Icons.call_to_action_rounded),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 50.0, right: 50.0, top: 10, bottom: 0),
                    // padding: EdgeInsets.symmetric(horizontal: 65),
                    child: widgetTextField(
                        fechaNacimiento, 'Fecha Ncto.', 'Ingrese nombre',Icons.date_range_outlined),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 50.0, right: 50.0, top: 10, bottom: 0),
                    // padding: EdgeInsets.symmetric(horizontal: 65),
                    child:
                        widgetTextField(telefono, 'Teléfono', 'Ingrese teléfono',Icons.phone),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 50.0, right: 50.0, top: 10, bottom: 0),
                    // padding: EdgeInsets.symmetric(horizontal: 65),
                    child: widgetTextField(email, 'Email', 'Ingrese email',Icons.email),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 50.0, right: 50.0, top: 10, bottom: 20),
                    // padding: EdgeInsets.symmetric(horizontal: 65),
                    child: widgetTextField(
                        direccion, 'Dirección', 'Ingrese dirección',Icons.home),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 40,
                        width: 150,
                        decoration: BoxDecoration(
                          color: ColorsSchool.primaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextButton(
                          onPressed: (){
                            // Navigator.of(context).pop();
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> AlumnosLista()));
                            // setState(() {
                            //
                            // });
                          },
                          child: Text(
                            'Cancelar',
                            style: TextStyle(color: ColorsSchool.fourthColor, fontSize: 15),
                          ),
                        ),
                      ),

                      Container(
                        height: 40,
                        width: 150,
                        decoration: BoxDecoration(
                          color: ColorsSchool.primaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: FlatButton(
                          onPressed: () async {
                            if(widget.dataAlumno!=null){
                              actualizar();
                            }else{
                              agregar();
                            }
                            setState(() {

                            });
                            //TODO si se agrego correctamente
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> AlumnosLista()));

                          },
                          child: widget.dataAlumno !=null? Text(
                            'Actualizar',
                            style: TextStyle(color: ColorsSchool.fourthColor, fontSize: 15),
                          ): Text('Agregar',style: TextStyle(color: ColorsSchool.fourthColor, fontSize: 15),),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
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

  TextField widgetTextField(controller, String label, String placeholder,IconData icono) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          // border: OutlineInputBorder(),
          labelText: label,
          hintText: placeholder,
          icon: Icon(icono,color: ColorsSchool.primaryColor,)
      ),
    );
  }


}
