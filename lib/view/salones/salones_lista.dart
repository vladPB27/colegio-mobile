import 'package:colegio_app/model/colors.dart';
import 'package:colegio_app/model/salon.dart';
import 'package:colegio_app/repository/salon_repository.dart';
import 'package:flutter/material.dart';

class SalonesLista extends StatefulWidget {
  const SalonesLista({Key? key}) : super(key: key);

  @override
  State<SalonesLista> createState() => _SalonesListaState();
}

class _SalonesListaState extends State<SalonesLista> {

  late Future<List<Salon>> _salonesList;
  var salonWebRepo = SalonWebRepository();

  @override
  void initState() {
    _salonesList = salonWebRepo.getSalones();
    super.initState();
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
            // Navigator.of(context)
                // .push(MaterialPageRoute(builder: (_) => FormAlumnos(null)));
          },
        ),
      ),
      // drawer: NavigationDrawerWidget(),
      backgroundColor: ColorsSchool.secondaryColor,
      body: SafeArea(
        // child: SingleChildScrollView(
        child:  Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  height: 650,
                  color: ColorsSchool.fourthColor,
                  child: Card(
                    child: FutureBuilder<List<Salon>>(
                      // future: alumnoWebRepo.getAlumnos(),
                      future: _salonesList,
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
                                      Text('${snapshot.data?[i].grado}'),
                                      subtitle: Text(
                                        '${snapshot.data?[i].seccion}',
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
                                                      '${snapshot.data?[i].seccion}',
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
                                                      '${snapshot.data?[i].seccion}',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: ColorsSchool
                                                              .secondaryColor),
                                                    )
                                                  ],
                                                ),
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
                                                                // FormAlumnos(
                                                                //     snapshot.data![
                                                                //     i])));
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
              ),
            ],
          ),
        // ),
      ),
      // bottomNavigationBar: NavigationBar(),
    );
  }
}
