import 'dart:ffi';

import 'package:colegio_app/model/alumnos.dart';
import 'package:colegio_app/model/colors.dart';
import 'package:colegio_app/repository/alumno_repository.dart';
import 'package:colegio_app/view/form_alumnos.dart';
import 'package:colegio_app/view/home.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AlumnosLista extends StatefulWidget {
  const AlumnosLista({Key? key}) : super(key: key);

  @override
  State<AlumnosLista> createState() => _AlumnosListaState();
}

class _AlumnosListaState extends State<AlumnosLista> {
  late Future<List<Alumno>> _alumnosList;
  var alumnoWebRepo = AlumnoWebRepository();

  Future _refreshAgain() async {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _alumnosList = alumnoWebRepo.getAlumnos();
    print('LIST => $_alumnosList');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Alumnos',
          style: TextStyle(color: ColorsSchool.fourthColor),
        ),
        backgroundColor: ColorsSchool.primaryColor,
        leading: IconButton(
          icon: Icon(Icons.add_circle),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => FormAlumnos(null)));
          },
        ),
      ),
      // drawer: NavigationDrawerWidget(),
      backgroundColor: ColorsSchool.secondaryColor,
      body: SafeArea(
        // child: SingleChildScrollView(
        child: RefreshIndicator(
          onRefresh: _refreshAgain,
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  height: 650,
                  color: HexColor('#e7ece6'),
                  child: Card(
                    child: FutureBuilder<List<Alumno>>(
                      // future: alumnoWebRepo.getAlumnos(),
                      future: _alumnosList,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Container(
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        } else
                          return ListView.builder(
                              itemCount: snapshot.data?.length,
                              itemBuilder: (context, i) {
                                return GestureDetector(
                                  onTap: () {},
                                  child: Card(
                                    child: ExpansionTile(
                                      leading: CircleAvatar(
                                        backgroundImage: AssetImage(
                                            'assets/images/user.png'),
                                      ),
                                      title:
                                          Text('${snapshot.data?[i].nombres}'),
                                      subtitle: Text(
                                        '${snapshot.data?[i].apellidoPaterno} ${snapshot.data?[i].apellidoMaterno}',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: ColorsSchool.secondaryColor),
                                      ),
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(Icons.payment),
                                                    Text(
                                                      '${snapshot.data?[i].dni}',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: ColorsSchool
                                                              .secondaryColor),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(Icons.phone),
                                                    Text(
                                                      '${snapshot.data?[i].celular}',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: ColorsSchool
                                                              .secondaryColor),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(Icons.home),
                                                    Text(
                                                      '${snapshot.data?[i].direccion}',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: ColorsSchool
                                                              .secondaryColor),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (_) =>
                                                                FormAlumnos(
                                                                    snapshot.data![
                                                                        i])));
                                                  },
                                                  child: Icon(
                                                    Icons.edit,
                                                    color:
                                                        ColorsSchool.primaryColor,
                                                    size: 25,
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    exitDialog(
                                                        snapshot.data![i].id);
                                                    alumnoWebRepo.deleteAlumno(snapshot.data![i].id!);
                                                    // setState(() {
                                                    //   print('refrescando screen');
                                                    // });
                                                  },
                                                  child: Icon(
                                                    Icons.delete,
                                                    color: Colors.red,
                                                    size: 25,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                                Divider(
                                  color: Colors.black,
                                );
                              });
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // ),
      ),
      // bottomNavigationBar: NavigationBar(),
    );
  }

  Future<bool>? exitDialog(id) {
    final heightDialog = MediaQuery.of(context).size.height * 0.23;
    final widthDialog = MediaQuery.of(context).size.width * 0.75;
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Container(
            width: widthDialog,
            height: heightDialog,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: ColorsSchool.secondaryColor),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        'Quieres eliminar el elemento $id?',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'OverpassRegular',
                            decoration: TextDecoration.none),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    // color: Colors.amberAccent,
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              alumnoWebRepo.deleteAlumno(id);
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                ),
                              ),
                              elevation: 7,
                              primary: ColorsSchool.thirdColor,
                              minimumSize:
                                  Size(widthDialog / 2, heightDialog / 3),
                              // onPrimary: Colors.amberAccent
                            ),
                            child: Text('Yes',
                                style: TextStyle(
                                    fontFamily: 'OverpassBold', fontSize: 18)),
                          ),
                        ),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop(false);
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(15),
                                  ),
                                ),
                                elevation: 7,
                                minimumSize:
                                    Size(widthDialog / 2, heightDialog / 3),
                                // primary: ColorsNearVoice.primaryColor,
                                primary: ColorsSchool.thirdColor,
                                onPrimary: ColorsSchool.fifthColor),
                            child: Text('No',
                                style: TextStyle(
                                    fontFamily: 'OverpassBold', fontSize: 18)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
