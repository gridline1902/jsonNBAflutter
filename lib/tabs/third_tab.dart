import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_nba/model/games.dart';

class ThirdTab extends StatelessWidget {
  ThirdTab({super.key});

   List<Game> games = []; 

  // get teams
  Future getGames() async {
    var response = await http.get(Uri.https('balldontlie.io', 'api/v1/games'));
    var jsonData = jsonDecode(response.body);

    for (var eachGame in jsonData['data']) {
      final game = Game(
        home_team_score: eachGame['home_team_score'],
        visitor_team_score: eachGame['visitor_team_score'],
        // season: eachGame['season'],
        );
        games.add(game);
    }
}

  @override
  Widget build(BuildContext context) {
    getGames();
    return Scaffold(
      body: FutureBuilder(future: getGames(),
      builder: (context, snapshot) {
        // done loading? show team data
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView.builder(
            itemCount: games.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius:  BorderRadius.circular(12)
                  ),
                  child: ListTile(
                    title: Text(games[index].home_team_score),
                    subtitle: Text(games[index].visitor_team_score),
                  ),
                ),
              );
          },

          );
        }
        // still loading? show loading circle
        else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
      ),
    );
  }
}