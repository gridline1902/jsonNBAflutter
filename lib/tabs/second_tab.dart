import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_nba/model/players.dart';

class SecondTab extends StatelessWidget {
  SecondTab({super.key});

   List<Player> players = []; 

  // get teams
  Future getPlayers() async {
    var response = await http.get(Uri.https('balldontlie.io', 'api/v1/players'));
    var jsonData = jsonDecode(response.body);

    for (var eachPlayer in jsonData['data']) {
      final player = Player(
        first_name: eachPlayer['first_name'],
        last_name: eachPlayer['last_name'],
        );
        players.add(player);
    }
}

  @override
  Widget build(BuildContext context) {
    getPlayers();
    return Scaffold(
      body: FutureBuilder(future: getPlayers(),
      builder: (context, snapshot) {
        // done loading? show team data
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView.builder(
            itemCount: players.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius:  BorderRadius.circular(12)
                  ),
                  child: ListTile(
                    title: Text(players[index].first_name),
                    subtitle: Text(players[index].last_name),
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