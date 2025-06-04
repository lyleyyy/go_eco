import 'package:flutter/material.dart';

import 'Leaderboard.dart';
import 'Profile.dart';
import 'Track.dart';
import 'Activities.dart';


class Tabs extends StatefulWidget {
  final Map arguments;

  const Tabs({super.key, required this.arguments});


  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Go Eco"),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green,
        centerTitle: true,
        actions: [
          Text("Welcome! " + widget.arguments['username'],style: const TextStyle
            (fontSize: 20, color: Colors.black87),),
          const SizedBox(width:10),
        ],
      ),
      body: [
        //TrackPage(),
        ActivitiesPage(arguments: widget.arguments,),
        LeaderboardPage(arguments: widget.arguments),
        ProfilePage(arguments: widget.arguments,)
      ][_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.green,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (int index){
          setState(() {
            _currentIndex=index;
          });
        },
        items: const [
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.track_changes),
          //     label: "Track"
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_activity),
            label: "Activities",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: "Leaderboard",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle),
            label: "Profile",
          ),
        ],
      ),
    );
  }

}