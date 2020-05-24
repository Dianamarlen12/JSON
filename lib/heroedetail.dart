import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class Informacion extends StatelessWidget {
  final dcHeroes heroes;

  Informacion (this.heroes);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(heroes.superheroe.toString().toUpperCase()),
      ),
      body: Container(
        color: Colors.lightBlueAccent[100],
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Center(
            child: Card(
              color: Colors.white10,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      alignment: AlignmentDirectional.center,
                      height: 350,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        image: DecorationImage(image: NetworkImage(heroes.img)),
                      ),
                    ),
                    Center(
                      child: new Text("IDENTIDAD SECRETA: ",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20),
                      ),
                    ),
                      Text(heroes.identidad,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 25),
                      ),
                    Text(""),
                    Center(child: Text("EDAD: ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                    ),
                    ),
                    Text(heroes.edad,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 25),
                    ),
                    Text(""),
                    Center(child: Text("ALTURA: ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    ),
                    Text(heroes.altura,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20),
                    ),
                    Text(""),
                    Center(child: Text("GENERO: ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    ),
                    Text(heroes.genero,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20),
                    ),
                    Text(""),
                    Center(child: Text("BREVE DESCRIPCIÓN: ",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                     ),
                    ),
                    Text(heroes.descripcion,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}