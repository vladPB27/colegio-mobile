import 'package:colegio_app/model/colors.dart';
import 'package:colegio_app/model/docente.dart';
import 'package:colegio_app/repository/docente_repository.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class DocentesLista extends StatefulWidget {
  const DocentesLista({Key? key}) : super(key: key);

  @override
  State<DocentesLista> createState() => _DocentesListaState();
}

class _DocentesListaState extends State<DocentesLista> {
  var docenteWebRepo = DocenteWebRepository();

  @override
  void initState() {
    docenteWebRepo.getDocentes();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Docentes'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                height: 650,
                color: HexColor('#e7ece6'),
                child: Card(
                  child: FutureBuilder<List<Docente>>(
                    // future: alumnoWebRepo.getAlumnos(),
                    future: docenteWebRepo.getDocentes(),
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
                                      '${snapshot.data?[i].apellidos} ${snapshot.data?[i].especialidad}',
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
                                                  // Navigator.of(context).push(
                                                  //     MaterialPageRoute(
                                                  //         builder: (_) =>
                                                  //             FormAlumnos(
                                                  //                 snapshot.data![
                                                  //                 i])));
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
                                                  // exitDialog(
                                                  //     snapshot.data![i].id);
                                                  // alumnoWebRepo.deleteAlumno(snapshot.data![i].id!);
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
            )
          ],
        ),
      ),
    );
  }
}
