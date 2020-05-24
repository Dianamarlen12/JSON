import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'main.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SplashScreen(
        title: Text(
          "Espera un momento...",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 35, color: Colors.white),
        ),
        photoSize: 120,
        seconds: 6,
        backgroundColor: Colors.blue[200],
        image: Image.network('https://dam.smashmexico.com.mx/wp-content/uploads/2018/11/marvel-mcu-universo-cinematografico-marvel-linea-de-tiempo-cover2-770x513.jpg'),
        navigateAfterSeconds: HomePage());
  }
}