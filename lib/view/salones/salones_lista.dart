import 'package:flutter/material.dart';

class SalonesLista extends StatefulWidget {
  const SalonesLista({Key? key}) : super(key: key);

  @override
  State<SalonesLista> createState() => _SalonesListaState();
}

class _SalonesListaState extends State<SalonesLista> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Salones'),
      ),
    );
  }
}
