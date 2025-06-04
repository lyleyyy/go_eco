import 'dart:convert';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:go_eco/netconfig.dart';
import 'package:http/http.dart';
import '../models/activity.dart';
import '../pages/tabs/Profile.dart';
import './chart_bar.dart';

class Chart extends StatefulWidget {
  // const Chart({super.key});
  final Map arguments;

  Chart(List<Activity> activities, {super.key, required this.arguments});

  @override
  _ChartState createState() => _ChartState();
}
class _ChartState extends State<Chart>{
 var food = 0.0;
 var transport = 0.0;
 var energy = 0.0;
 var total = 0.0;
  @override
  Widget build(BuildContext context) {
    print(widget.arguments['email']);
    NetConfig.getchart('123@123.com').then((value){
      dynamic data = jsonDecode(value.toString());
      food = double.parse(data[0]['food']);
      transport = double.parse(data[0]['transport']);
      energy = double.parse(data[0]['energy']);
      total = double.parse(data[0]['total']);
    });
    List bars = [
      ChartBar('food',0.0,food/total, Colors.blue, label: 'food', amount: 0.0, percent: food/total, color: Colors.blue,)
      ,
      ChartBar('transport',0.0,transport/total, Colors.cyan, label: 'transport', amount: 0.0, percent: transport/total, color: Colors.cyan,)
      ,
      ChartBar(
        'Energy',
        0.0,
        energy/total,
        Colors.pink, label: 'Energy', amount: 0.0, percent: energy/total, color: Colors.pink),
    ];
    return Container(
      height: 230,
      child: Card(
        elevation: 6,
        margin: EdgeInsets.all(20),
        //padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: bars.map((data) {
            return ChartBar(
              data.label,
              data.amount,
              data.percent,
              data.color, label: data.label, amount: data.amount, percent: data.percent, color: data.color,
            );
          }).toList(),
        ),
      ),
    );
  }

}
