import 'package:flutter/material.dart';

void main() {
  runApp(const MuseumApp());
}

class MuseumApp extends StatelessWidget {
  const MuseumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Museum',
      theme:
          ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown)),
      home: const ArtWork(),
    );
  }
}

class ArtWork extends StatefulWidget {
  const ArtWork({super.key});

  @override
  State<StatefulWidget> createState() => _ArtWorkState();
}

class _ArtWorkState extends State<ArtWork> {
  bool _isFavorite = false;

  void _setIsFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[200],
        title: const Text('Museum'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset('images/Mona_Lisa.jpg'),
                Align(
                  alignment: Alignment.center,
                  child: Icon(Icons.favorite,
                      size: 100,
                      color: (_isFavorite)
                          ? Colors.red.withOpacity(1.0)
                          : Colors.white.withOpacity(0.75)),
                )
              ],
            ),
            const Text(
              'Mona Lisa',
              style: TextStyle(
                  fontFamily: 'Merriweather',
                  fontSize: 30,
                  color: Colors.brown),
            ),
            const Text(
              'Léonard de Vinci',
              style: TextStyle(
                  fontFamily: 'Merriweather',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.article),
                  color: Colors.brown,
                  onPressed: () => {},
                ),
                IconButton(
                  icon: const Icon(Icons.favorite),
                  color: _isFavorite ? Colors.red : Colors.brown,
                  onPressed: () => {
                    _setIsFavorite(),
                    _isFavorite
                        ? const SnackBar(
                            content: Text('Oeuvre ajoutée à vos favoris'))
                        : ''
                  },
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: const Text('Bouton'),
    );
  }
}
