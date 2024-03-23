import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kuis_123210062/models/game_store.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:kuis_123210062/models/game_store.dart';

class GameDetailScreen extends StatefulWidget {
  final GameStore games;
  const GameDetailScreen({super.key, required this.games});

  @override
  State<GameDetailScreen> createState() => _GameDetailState();
}

class _GameDetailState extends State<GameDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.games.name,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Container(
            height: 250,
            width: 300,
            child: Image.network(widget.games.imageUrls[0]),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    widget.games.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        widget.games.price,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Realease Date: " + widget.games.releaseDate,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Rating: " + widget.games.reviewAverage,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text("Genre: ",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          )),
                      for (final item in widget.games.tags) Text(item + " "),
                    ],
                  ),
                  SizedBox(height: 15),
                  Container(
                    child: Text(
                      widget.games.about,
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Colors
                              .black, // You can set the color of the line here
                          width: 2.0, // You can set the width of the line here
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _launchedUrl(widget.games.linkStore);
        },
        child: Icon(Icons.open_in_browser),
      ),
    );
  }

  Future<void> _launchedUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
