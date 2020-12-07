import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(
        title: 'Basic Phrases Translation',
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> audioList = [
    'salut',
    'salut (Germană)',
    'eu sunt',
    'eu sunt (Germană)',
    'vremea este',
    'vremea este (Germană)',
    'merg la cumparaturi',
    'merg la cumparaturi (Germană)',
  ];

  final AudioCache _audioCache = AudioCache();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
        centerTitle: true,
      ),
      body: GridView.builder(
        // or ListView.builder, builds only what's visible on screen
        padding: const EdgeInsets.all(8.0).copyWith(bottom: 16.0),
        itemCount:
            8, // without this line to make it infinite, represents index from 0 to N
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          // for the GridView only
          crossAxisCount: 2,
          mainAxisSpacing: 32.0,
          crossAxisSpacing: 32.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.red,
              border: Border.all(
                color: Colors.red,
              ),
              gradient: LinearGradient(
                // ignore: always_specify_types
                colors: [
                  Colors.redAccent,
                  Colors.lightGreen[400],
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Center(
              child: ListTile(
                title: Text(
                  audioList[index],
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                onTap: () => _audioCache.play(
                  'audiofiles/$index.mp3',
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
