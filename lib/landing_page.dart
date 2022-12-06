import 'package:flutter/material.dart';
import 'package:mobile_nba/tabs/first_tab.dart';
import 'package:mobile_nba/tabs/second_tab.dart';
import 'package:mobile_nba/tabs/third_tab.dart';

class LandPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('NBA API'),
        ),
        body: Column(
          children: [
            TabBar(
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.home,
                    color: Colors.deepPurple,
                  ),
                ),
                                Tab(
                  icon: Icon(
                    Icons.person,
                    color: Colors.deepPurple,
                  ),
                ),
                                Tab(
                  icon: Icon(
                    Icons.article,
                    color: Colors.deepPurple,
                  ),
                ),
              ],
              ),

              Expanded(
                child: TabBarView(children: [
                  // First Tab
                  FirstTab(),
                  
                  // Second Tab
                  SecondTab(),

                  // Third Tab
                  ThirdTab(),
                ]),
              )
          ],
        ),
        ),
        );
  }
}