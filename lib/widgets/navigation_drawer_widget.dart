import 'package:colegio_app/model/colors.dart';
import 'package:colegio_app/view/alumnos/alumnos_lista.dart';
import 'package:colegio_app/view/docentes/docentes_lista.dart';
import 'package:colegio_app/view/salones/salones_lista.dart';
import 'package:flutter/material.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final name = 'Usuario';
    final email = 'Usuario@gmail.com';
    final photo = 'assets/images/user.png';

    return Drawer(
      child: Material(
        color: ColorsSchool.primaryColor,
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30.0,horizontal: 20.0),
          children: [
            buildHeader(
                urlImage: photo, name: name, email: email, onClicked: () =>
            {
            }),
            const SizedBox(height: 20,),
            Divider(color: ColorsSchool.thirdColor,),
            buildMenuItem(text: 'Alumnos', icon: Icons.people,onClicked:()=> selectedItem(context, 0)),
            buildMenuItem(text: 'Docentes', icon: Icons.wc_outlined,onClicked:()=> selectedItem(context, 1)),
            buildMenuItem(
                text: 'Salones', icon: Icons.account_balance_outlined,onClicked:()=> selectedItem(context, 2)),
            Divider(color: ColorsSchool.fifthColor,),
            buildMenuItem(text: 'Ajustes', icon: Icons.settings,onClicked:()=> selectedItem(context, 3)),
            buildMenuItem(text: 'Acerca de', icon: Icons.mobile_screen_share_outlined,onClicked:()=> selectedItem(context, 4)),
            buildMenuItem(text: 'Cerrar Sesión', icon: Icons.logout,onClicked:()=> selectedItem(context, 5)),
          ],
        ),
      ),
    );
  }

  buildMenuItem({required String text, required IconData icon,required VoidCallback onClicked}) {
    return ListTile(
      leading: Icon(icon, color: ColorsSchool.secondaryColor,),
      title: Text(text, style: TextStyle(color: ColorsSchool.thirdColor),),
      onTap: () {
        onClicked();
      },
    );
  }

  buildHeader(
      {required String urlImage, required String name, required String email,required VoidCallback onClicked}) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          child: Row(
            children: [
              CircleAvatar(
                radius: 35, backgroundImage: AssetImage(urlImage),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('$name',style: TextStyle(color: ColorsSchool.fifthColor),),
                    Text('$email',style: TextStyle(color: ColorsSchool.fifthColor),),
                  ],
                ),
              )

            ],
          ),
        ),
      );

  selectedItem(BuildContext context, int index) {
    switch (index){
      case 0:
        Navigator.of(context).push(MaterialPageRoute(builder: (_)=> AlumnosLista()));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(builder: (_)=> DocentesLista()));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(builder: (_)=> SalonesLista()));
    }
  }

}