import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Appinn',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Conversor(title: 'Hotel El Cielo'),
    );
  }
}

class Conversor extends StatefulWidget {
  Conversor({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _ConversorState createState() => _ConversorState();
}

class _ConversorState extends State<Conversor> {

  var _output = "inicial";
  final inputController = TextEditingController();
  
  void _calculateTemp(){
    setState(() {
      double temperatura_original = double.parse(inputController.text);
      double temp_salida = (temperatura_original - 32) * 5/9;
      _output = "$temp_salida";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( //Una barra donde ponemos el titulo
        title: Text(widget.title), //Donde escribimos el titulo
        ),
        body: Center(
          child: Column(  //Body donde ponemos multiples de cosas
            children: [
              TextFormField(
                controller: 
                inputController,
                ),
              RaisedButton(
                onPressed: () {
                  _calculateTemp();
                  },),
              Text("$_output"),
            ],
           ),
        ), 
      );
  }
}