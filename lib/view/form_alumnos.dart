import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:colegio_app/api/api_constant.dart';
import 'package:colegio_app/model/alumnos.dart';
import 'package:colegio_app/model/colors.dart';
import 'package:colegio_app/repository/alumno_repository.dart';
import 'package:colegio_app/repository/storage_repository.dart';
import 'package:colegio_app/view/alumnos/alumnos_lista.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:developer';
import 'package:http/http.dart' as http;

class FormAlumnos extends StatefulWidget {
  final Alumno? dataAlumno;

  const FormAlumnos(this.dataAlumno, {Key? key}) : super(key: key);

  @override
  _FormAlumnosState createState() => _FormAlumnosState();
}

class _FormAlumnosState extends State<FormAlumnos> {
  final storage = Storage();
  var _img64 = '';
  File? _otherImg;
  String? _urlImage;
  String? _filePath;
  String? _fileName;
  DateTime _currentDate = DateTime.now();

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

  // final imagen = TextEditingController();

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
    // imagen.dispose();
    super.dispose();
  }

  Future addAlumn() async {
    try {
      await storage
          .uploadFile(_filePath!, _fileName!)
          .then((value) => print('file uploaded'));
      _urlImage = await storage.downloadURL(_fileName!);
      print('URl 3: $_urlImage');

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
          direccion: direccion.text,
          imagen: _urlImage);
      alumnoWebRepo.addAlumno(alumn);
    } catch (e) {
      throw Exception(e);
    }
  }

  updateAlumn() async {
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

  getDataUpdateStudent() {
    if (widget.dataAlumno != null) {
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
    } else {
      print('NULL');
    }
  }

  Future _selectDate(BuildContext context) async {
    print('date: $_currentDate');
    DateTime? _datePicker = await showDatePicker(context: context, initialDate: _currentDate, firstDate: DateTime(_currentDate.year-30), lastDate: DateTime(_currentDate.year+1));
    if(_datePicker !=null && _datePicker!=_currentDate){
      setState((){
        _currentDate = _datePicker;
        fechaNacimiento.text = '${_datePicker.day}/${_datePicker.month}/${_datePicker.year}';
      });
      print('date 2: $_currentDate');
    }
  }

  Widget build(BuildContext context) {

    String title = 'Date Picker';
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Agregar Alumno',
            style: TextStyle(color: ColorsSchool.fourthColor, fontSize: 25),
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
              Colors.white30,
              Colors.white10,
            ],
          )),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 50.0, right: 50.0, top: 10, bottom: 0),
                    child: buildImagePicker(),
                  ),
                  Padding(
                    // padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                    padding: EdgeInsets.only(
                        left: 50.0, right: 50.0, top: 10, bottom: 0),
                    child: widgetTextField(nombres, 'nombres', 'Ingrese nombre',
                        Icons.perm_identity_outlined),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 50.0, right: 50.0, top: 10, bottom: 0),
                    // padding: EdgeInsets.symmetric(horizontal: 65),
                    child: widgetTextField(
                        apPaterno,
                        'A. Paterno',
                        'Ingrese apellido paterno',
                        Icons.perm_identity_outlined),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 50.0, right: 50.0, top: 10, bottom: 0),
                    // padding: EdgeInsets.symmetric(horizontal: 65),
                    child: widgetTextField(apMaterno, 'A. Materno',
                        'Ingrese nombre', Icons.perm_identity_outlined),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 50.0, right: 50.0, top: 10, bottom: 0),
                    // padding: EdgeInsets.symmetric(horizontal: 65),
                    child: widgetTextField(
                        sexo, 'genero', 'Ingrese nombre', Icons.wc_outlined),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 50.0, right: 50.0, top: 10, bottom: 0),
                    // padding: EdgeInsets.symmetric(horizontal: 65),
                    child: widgetTextField(nroDni, 'DNI', 'Ingrese nombre',
                        Icons.call_to_action_rounded),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                          left: 50.0, right: 50.0, top: 10, bottom: 0),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 5,
                              child: widgetTextField(
                                  fechaNacimiento,
                                  'Fecha Ncto.',
                                  'Ingrese nombre',
                                  Icons.date_range_outlined)),
                          Expanded(
                              flex: 1,
                              child: TextButton(
                                  onPressed: () {},
                                  child: IconButton(
                                    icon: Icon(Icons.date_range_outlined),
                                    onPressed: () {
                                      _selectDate(context);
                                    },
                                  ))),
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 50.0, right: 50.0, top: 10, bottom: 0),
                    // padding: EdgeInsets.symmetric(horizontal: 65),
                    child: widgetTextField(
                        telefono, 'Teléfono', 'Ingrese teléfono', Icons.phone),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 50.0, right: 50.0, top: 10, bottom: 0),
                    // padding: EdgeInsets.symmetric(horizontal: 65),
                    child: widgetTextField(
                        email, 'Email', 'Ingrese email', Icons.email),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 50.0, right: 50.0, top: 10, bottom: 10),
                    // padding: EdgeInsets.symmetric(horizontal: 65),
                    child: widgetTextField(direccion, 'Dirección',
                        'Ingrese dirección', Icons.home),
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
                          onPressed: () {
                            // Navigator.of(context).pop();
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (_) => AlumnosLista()));
                            // setState(() {
                            //
                            // });
                          },
                          child: Text(
                            'Cancelar',
                            style: TextStyle(
                                color: ColorsSchool.fourthColor, fontSize: 15),
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
                            if (widget.dataAlumno != null) {
                              updateAlumn();
                            } else {
                              addAlumn();
                            }
                            setState(() {});
                            //TODO si se agrego correctamente
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (_) => AlumnosLista()));
                          },
                          child: widget.dataAlumno != null
                              ? Text(
                                  'Actualizar',
                                  style: TextStyle(
                                      color: ColorsSchool.fourthColor,
                                      fontSize: 15),
                                )
                              : Text(
                                  'Agregar',
                                  style: TextStyle(
                                      color: ColorsSchool.fourthColor,
                                      fontSize: 15),
                                ),
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
      );
  }

  TextField widgetTextField(
      controller, String label, String placeholder, IconData icono) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          // border: OutlineInputBorder(),
          labelText: label,
          hintText: placeholder,
          icon: Icon(
            icono,
            color: ColorsSchool.primaryColor,
          )),
    );
  }

  Stack buildImagePicker() {
    final double radiusImg = MediaQuery.of(context).size.width * 0.20;
    return Stack(
      children: [
        Container(
          color: Colors.white,
        ),
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            child: CircleAvatar(
              radius: radiusImg,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: radiusImg - 1,
                backgroundColor: Colors.white,
                backgroundImage: _otherImg == null
                    ? AssetImage('assets/images/user.png')
                    : Image.file(_otherImg!, fit: BoxFit.contain).image,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: CircleAvatar(
                    backgroundColor: ColorsSchool.thirdColor,
                    radius: 22.0,
                    child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                          // side: BorderSide(color: Colors.white),
                        ),
                        color: HexColor('#006059'),
                        child: Icon(
                          Icons.edit_outlined,
                          size: 15.0,
                          color: Colors.white,
                        ),
                        onPressed: () => _uploadFile()
                        // _imageUpload()
                        // _uploadTestImg(),
                        // _imagePickerDialog(),
                        ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  String _image1 = "";
  late File _image;
  String? _icon;
  final picker = ImagePicker();
  late PickedFile imageReal;

  Future _uploadFile() async {
    final results = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ['png', 'jpg']);
    if (results == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('no file selected')));
      return null;
    } else {
      _filePath = results.files.single.path;
      _fileName = results.files.single.name;

      setState(() {
        _otherImg = File(_filePath!);
        // _urlImage = url;
      });
    }
  }

  Future _uploadTestImg() async {
    var stream = new http.ByteStream(_otherImg!.openRead());
    stream.cast();
    var length = await _otherImg!.length();
    var request =
        http.MultipartRequest('POST', Uri.parse('${Apiconstant.url}/alumnos'));
    request.fields['nombres'] = "test";
    request.fields['apellidoPaterno'] = "test";
    request.fields['apellidoMaterno'] = "test";
    request.fields['sexo'] = "m";
    request.fields['dni'] = "test123";
    request.fields['fechaNacimiento'] = "123";
    // request.fields['image'] = "img123";

    var picture = new http.MultipartFile('image', stream, length);
    request.files.add(picture);
    var response = await request.send();
    print('STATUS: ${response.statusCode}');
  }

  Future getFromGallery() async {
    // final userInfo = Provider.of<User>(context, listen: false);

    imageReal = (await picker.getImage(source: ImageSource.gallery))!;
    setState(() {
      if (imageReal != null) {
        _image1 = imageReal.path;
        _image = File(imageReal.path);
        // print('img selected path: ${json.encode(_image1)}');
        final bytes = File(imageReal.path).readAsBytesSync();
        //TODO base64
        _img64 = base64Encode(bytes);
      } else {
        print('No image selected.');
      }
    });
  }

  Future _imageUpload() async {
    var image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _otherImg = File(image!.path);
      print('IMG: , ${_otherImg!.path}');
    });
  }

  // Future _getFromCamera() async {
  //   final userInfo = Provider.of<User>(context, listen: false);
  //
  //   userInfo.imageReal = await picker.getImage(source: ImageSource.camera);
  //
  //   if (userInfo.imageReal != null) {
  //     _image = File(userInfo.imageReal.path);
  //     final bytes = File(userInfo.imageReal.path).readAsBytesSync();
  //     String _img64Cam = base64Encode(bytes);
  //     userInfo.image = _img64Cam;
  //   }
  // }

  _imagePickerDialog() {
    // final userInfo = Provider.of<User>(context, listen: false);
    // final meeting = Provider.of<Meeting>(context, listen: false);
    final double heightDialog = MediaQuery.of(context).size.height * 0.6;

    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext, Animation animation,
            Animation secondaryAnimation) {
          return Padding(
            padding: EdgeInsets.only(bottom: heightDialog),
            child: Container(
              padding: EdgeInsets.all(10),
              color: HexColor('#003333').withOpacity(0.7),
              child: Column(
                children: [
                  Expanded(
                    child: SafeArea(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Column(
                              children: [
                                GestureDetector(
                                  child: Container(
                                    height: 70,
                                    width: 90,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: ColorsSchool.thirdColor),
                                    child: Icon(
                                      Icons.image_outlined,
                                      color: Colors.white,
                                      size: 40,
                                    ),
                                  ),
                                  onTap: () {
                                    getFromGallery();
                                    Navigator.of(context).pop();
                                  },
                                ),
                                Text(
                                  'Gallery',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      decoration: TextDecoration.none),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              children: [
                                GestureDetector(
                                  child: Container(
                                    height: 70,
                                    width: 90,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: ColorsSchool.primaryColor),
                                    child: Icon(
                                      Icons.camera_alt_outlined,
                                      color: Colors.white,
                                      size: 40,
                                    ),
                                  ),
                                  onTap: () {
                                    // _getFromCamera();
                                    // Navigator.of(context).pop();
                                  },
                                ),
                                Text(
                                  "Camera",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      decoration: TextDecoration.none),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10, bottom: 10, top: 10),
                      // child: Swiper(
                      //   pagination: SwiperControl(color: Colors.white),
                      //   itemCount: oIcon.iconMeetingList.length,
                      //   itemBuilder: (context, index) {
                      //     return GestureDetector(
                      //       onTap: () {
                      //         setState(() {
                      //           userInfo.icon = oIcon.iconMeetingList[index];
                      //           userInfo.imageReal = null;
                      //           userInfo.image = null;
                      //           meeting.image = oIcon.iconMeetingList[index];
                      //           Navigator.of(context).pop();
                      //         });
                      //       },
                      //       child: Container(
                      //         decoration: BoxDecoration(
                      //           shape: BoxShape.circle,
                      //           image: DecorationImage(
                      //             fit: BoxFit.contain,
                      //             image: AssetImage(oIcon.iconMeetingList[index]),
                      //           ),
                      //         ),
                      //       ),
                      //     );
                      //   },
                      // ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
