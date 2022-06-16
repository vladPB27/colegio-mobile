import 'dart:convert';
import 'package:colegio_app/model/colors.dart';
import 'package:colegio_app/model/todo.dart';
import 'package:colegio_app/repository/alumno_repository.dart';
import 'package:colegio_app/repository/todo_repository.dart';
import 'package:colegio_app/widgets/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Home extends StatefulWidget {
  const Home({key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var alumnoWebRepo = AlumnoWebRepository();

  @override
  void initState() {
    print('VIEW HOME');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double widthScreen = MediaQuery.of(context).size.width;
    final double heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'I.E.P. Cusco',
            style: TextStyle(color: ColorsSchool.fourthColor),
          ),
          backgroundColor: ColorsSchool.primaryColor,
        ),
        drawer: NavigationDrawerWidget(),
        backgroundColor: ColorsSchool.fifthColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    cardHome('Alumnos','Lista de alumnos',Icons.people_alt,widthScreen),
                    cardHome('Docentes','Lista de alumnos',Icons.accessibility_new_outlined,widthScreen),
                  ],
                ),
                Row(
                  children: [
                    cardHome('Salones','Lista de salones',Icons.account_balance_rounded,widthScreen),
                    cardHome('Personal','Lista del personal',Icons.work_outlined,widthScreen),
                  ],
                ),
                Row(
                  children: [
                    cardHome('Matriculas','Hacer una matricula',Icons.school,widthScreen),
                    cardHome('Consultas','contactenos',Icons.phone,widthScreen),
                  ],
                )
                // Container(
                //   // margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                //   height: 150,
                //   width: widthScreen*0.5,
                //   decoration: BoxDecoration(color: ColorsSchool.primaryColor),
                // ),
              ],

              // Container(
              //   margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              //   height: 150,
              //   // width: 150,
              //   decoration: BoxDecoration(color: ColorsSchool.thirdColor),
              // ),
              // Container(
              //   margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              //   height: 150,
              //   // width: 150,
              //   decoration: BoxDecoration(color: ColorsSchool.fourthColor),
              // ),
              // ],
            ),
            // ),
          ),
        )
        // bottomNavigationBar: NavigationBar(),
        );
  }

  Container cardHome(String title, String subtitle, IconData icon,double widthScreen) {
    return Container(
      height: widthScreen * 0.5,
      width: widthScreen * 0.5,
      child: Card(
        elevation: 3,
        shadowColor: ColorsSchool.primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(icon,size: 60),
            ListTile(
              // leading: Icon(Icons.access_alarm_rounded),
              title: Center(child: Text(title)),
              subtitle: Center(child: Text(subtitle)),
            ),
          ],
        ),
      ),
    );
  }
}
