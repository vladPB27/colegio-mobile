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

  Future _refreshAgain() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
        // child: SingleChildScrollView(
        child: RefreshIndicator(
          onRefresh: _refreshAgain,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  height: 150,
                  // width: 150,
                  decoration: BoxDecoration(color: ColorsSchool.primaryColor),
                ),
              ),
              Expanded(
                  child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                height: 150,
                // width: 150,
                decoration: BoxDecoration(color: ColorsSchool.secondaryColor),
              )),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  height: 150,
                  // width: 150,
                  decoration: BoxDecoration(color: ColorsSchool.thirdColor),
                ),
              ),
              Expanded(
                  child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                height: 150,
                // width: 150,
                decoration: BoxDecoration(color: ColorsSchool.fourthColor),
              )),
            ],
          ),
        ),
        // ),
      ),
      // bottomNavigationBar: NavigationBar(),
    );
  }
}
