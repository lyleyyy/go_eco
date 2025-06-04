import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_eco/netconfig.dart';

class LeaderboardPage extends StatefulWidget {
  final Map arguments;
  const LeaderboardPage({super.key, required this.arguments});

  @override
  _LeaderboardPageState createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  List<Widget> list = [];
  int total = 0;
  int myTotal = 0;

  @override
  initState() {
    List<Widget> templist = [];
    int temptotal = 0;
    int tempMyTotal = 0;
    NetConfig.grab().then((value) {
      List data = jsonDecode(value.toString());
      for (Map i in data) {
        if (i['username'] == widget.arguments['username']) {
          tempMyTotal = int.parse(i['total']);
        }
        temptotal += int.parse(i['total']);
        templist.add(ListTile(title: Text("  " + i['username'], style: const TextStyle(fontSize: 15, color:
        Colors.blueAccent),),
          trailing:
        Text
          (i['total'] + "   ", style: const TextStyle(fontSize: 15, color:
        Colors.blueAccent))
          ,));
      }
      setState(() {
        list = templist;
        total = temptotal;
        myTotal = tempMyTotal;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              const SizedBox(height: 10),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: 'Total   ',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.green,
                    ),
                    children: [
                      TextSpan(
                          text: total.toString(),
                          style: const TextStyle(
                              fontSize: 25, color: Colors.blue)),
                      const TextSpan(
                        text: '    trees',
                        style: TextStyle( color: Colors.green),
                      )
                    ]),
              ),
              const SizedBox(height: 5),
              Image.asset(
                "images/trees.jpg",
                width: 220,
                height: 220,
              ),
              const SizedBox(height: 5),
              Container(
                  alignment: Alignment.bottomLeft,
                  child: const Text(
                    "Your contribution:",
                    style: TextStyle(fontSize: 20, color: Colors.green),
                    textAlign: TextAlign.left,
                  )),
              ListTile(
                title: Text(widget.arguments['username'],style: const TextStyle
                  (fontSize: 20, color: Colors.green),),
                trailing: Text(myTotal.toString() + " ", style: const TextStyle(
                  fontSize: 20, color: Colors.green
                )),
              ),
              const SizedBox(height: 5),
              const Text("Leaderboard",style: TextStyle(fontSize: 20,color:
              Colors.green)),
              const SizedBox(height: 5,),
              const Text(' Name                                       '
                  '   Plant  ',style: TextStyle(color: Colors.green,
                  fontSize: 20))
            ],
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  color: Color.fromRGBO(199, 237, 204, 1)
              ),
              child: SingleChildScrollView(
                child: ListView(
                  shrinkWrap: true,
                  children: list,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
