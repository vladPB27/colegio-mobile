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
          'I.E.P. Qenqoro',
          style: TextStyle(color: ColorsSchool.secondaryColor),
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
              Text('HOME')
            ],
          ),
        ),
        // ),
      ),
      // bottomNavigationBar: NavigationBar(),
    );
  }
}
