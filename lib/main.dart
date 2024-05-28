import 'package:Lista_Compras/screens/Vista.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lista de compras',
          style: TextStyle(color: Colors.white), 
        ),
        backgroundColor: Colors.black,
      ),
      body: ViewItemsPage(), 
    );
  }
}
