import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kuis_123210062/views/game_details.dart';
import 'package:kuis_123210062/views/login_page.dart';
import '../models/game_store.dart';

class GameListScreen extends StatefulWidget {
  const GameListScreen({super.key});

  @override
  State<GameListScreen> createState() => _GameListState();
}

class _GameListState extends State<GameListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Daftar Games (123210062)",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                icon: new Icon(Icons.logout),
                color: Colors.white),
          ],
          backgroundColor: Colors.red),
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: ((context, index) {
          final GameStore games = gameList[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => GameDetailScreen(games: games)));
            },
            child: Card(
              child: Column(
                children: [
                  Container(
                    width: 250,
                    child: Image.network(games.imageUrls[0]),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text(games.name,
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )),
                        Text(
                          games.price,
                          style: GoogleFonts.poppins(),
                        ),
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "Rating: " + games.reviewAverage,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
        itemCount: gameList.length,
      ),
    );
  }
}
