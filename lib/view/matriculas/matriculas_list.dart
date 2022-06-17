import 'package:colegio_app/model/colors.dart';
import 'package:colegio_app/model/matricula.dart';
import 'package:colegio_app/view/matriculas/form_matricula.dart';
import 'package:flutter/material.dart';

class MatriculasList extends StatefulWidget {
  const MatriculasList({Key? key}) : super(key: key);

  @override
  State<MatriculasList> createState() => _MatriculasListState();
}

class _MatriculasListState extends State<MatriculasList> {
  Future _refreshAgain() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Matriculas',
          style: TextStyle(color: ColorsSchool.fourthColor),
        ),
        backgroundColor: ColorsSchool.primaryColor,
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _refreshAgain,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: FutureBuilder<List<Matricula>>(
                    // future: alumnoWebRepo.getAlumnos(),
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
                              return Card(
                                child: ExpansionTile(
                                  trailing: Wrap(
                                    crossAxisAlignment:
                                    WrapCrossAlignment.center,
                                    children: [
                                      IconButton(
                                          icon: Icon(Icons.more_vert_outlined),
                                          onPressed: () {}),
                                      Icon(Icons.arrow_drop_down)
                                    ],
                                  ),
                                  title: Text('nombres'),
                                  subtitle: Text(
                                    'data',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: ColorsSchool.secondaryColor),
                                  ),
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.payment),
                                                Text(
                                                  'data',
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
                                                  'data',
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
                                                  'data',
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
                                          mainAxisAlignment:
                                          MainAxisAlignment.end,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
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
                                // Expanded(child: Icon(Icons.five_g))
                              );
                              Divider(
                                color: Colors.black,
                              );
                            });
                    },
                  ),
                ),
              ),
              buildFooterNavigation(context, ColorsSchool.primaryColor)
            ],
          ),
        ),
        // ),
      ),
    );
  }

  Container buildFooterNavigation(BuildContext context, Color color) {
    return Container(
      margin: EdgeInsets.zero,
      color: ColorsSchool.fifthColor,
      height: 65,
      child: Row(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_outlined,
                    size: 25,
                    color: color,
                  ),
                  onPressed: () {},
                ),
                Text(
                  'Volver',
                  style: TextStyle(color: color, fontSize: 12),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.home,
                      size: 25,
                      color: color,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/create_loading');
                    }),
                Text(
                  'Inicio',
                  style: TextStyle(color: color, fontSize: 12),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.add_circle_outline,
                    size: 25,
                    color: color,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => FormMatricula()));
                  },
                ),
                Text(
                  'Matrícula nueva',
                  style: TextStyle(color: color, fontSize: 12),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

}
