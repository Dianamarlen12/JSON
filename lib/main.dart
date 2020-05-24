import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'screen.dart';
import 'heroedetail.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class dcHeroes {
  final String img;
  final String superheroe;
  final String identidad;
  final String edad;
  final String altura;
  final String genero;
  final String descripcion;

  dcHeroes(this.img, this.superheroe, this.identidad, this.edad, this.altura,
      this.genero, this.descripcion);
}
void main() {
  runApp(
    new MaterialApp(
      theme:
          ThemeData(brightness: Brightness.light, primarySwatch: Colors.blue),
      darkTheme:
          ThemeData(brightness: Brightness.dark, primarySwatch: Colors.blue),
      home: new MyApp(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class HomePage extends StatefulWidget {
  @override
  homePageState createState() => new homePageState();
}

class homePageState extends State<HomePage> {
  Future<String> _loadAsset() async {
    return await rootBundle.loadString('assets/superheroes.json');
  }

  Future<List<dcHeroes>> _getHeroes() async {
    String jsonString = await _loadAsset();
    var jsonData = jsonDecode(jsonString);

    List<dcHeroes> heroes = [];
    for (var i in jsonData) {
      dcHeroes he = dcHeroes(i["img"], i["superheroe"], i["identidad"],
          i["edad"], i["altura"], i["genero"], i["descripcion"]);
      heroes.add(he);
    }
    return heroes;
  }

  String searchString = "";
  bool _buscar = false;
  final searchController = TextEditingController();

  AudioPlayer audioPlayer;
  AudioCache audioCache;

  final audio = "audio.mp3";

  @override
  void initState() {
    super.initState();

    audioPlayer = AudioPlayer();
    audioCache = AudioCache();
    var loop = 1;

    setState(() {
      audioCache.play(audio);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: _buscar
            ? TextField(
                decoration: InputDecoration(
                    hintText: "SUPERHEROE", icon: Icon(Icons.search)),
                onChanged: (value) {
                  setState(() {
                    searchString = value;
                  });
                },
                controller: searchController,
              )
            : Text("SUPERHEORES MARVEL"),
        actions: <Widget>[
          !_buscar
              ? IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      searchString = "";
                      this._buscar = !this._buscar;
                    });
                  },
                )
              : IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () {
                    setState(() {
                      this._buscar = !this._buscar;
                    });
                  },
                )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          child: FutureBuilder(
            future: _getHeroes(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Center(
                    child: Text(
                      "Cargando...",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          color: Colors.white),
                    ),
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return snapshot.data[index].superheroe
                            .contains(searchString)
                        ? ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  snapshot.data[index].img.toString()),
                            ),
                            title: Text(
                              snapshot.data[index].superheroe
                                  .toString()
                                  .toUpperCase(),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Informacion(snapshot.data[index])));
                            },
                          )
                        : Container();
                  },
                );
              }
            },
          ),
        ),
      ),
      drawer: Drawer(
        elevation: 16.0,
        child: ListView(
          children: const <Widget>[
            DrawerHeader(
              child: Text("INTEGRANTES",
                  style: TextStyle(fontFamily: 'Carter', fontSize: 30)),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              title: Text(
                "Meneses Alegria Diana Marlen",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


