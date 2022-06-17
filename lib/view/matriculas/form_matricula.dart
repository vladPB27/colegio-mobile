import 'package:flutter/material.dart';

class FormMatricula extends StatefulWidget {
  const FormMatricula({Key? key}) : super(key: key);

  @override
  State<FormMatricula> createState() => _FormMatriculaState();
}

class _FormMatriculaState extends State<FormMatricula> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Matricula nueva'),
      ),
    );
  }
}
