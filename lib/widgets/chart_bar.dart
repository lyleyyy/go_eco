import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class ChartBar extends StatefulWidget {
  // const ChartBar({super.key});

  final String label;
  final double amount;
  final double percent;
  final Color color;

  const ChartBar(String s, double d, double d2, MaterialColor blue, {
    required this.label,
    required this.amount,
    required this.percent,
    required this.color
  });
  @override
  ChartBarState createState() => ChartBarState();

}

class ChartBarState extends State<ChartBar>{
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context)=>Column(
      children: <Widget>[
        const SizedBox(height: 40),
        Text((widget.percent * 100).toInt().toString() + '%'),
        Container(
          height: 100,
          width: 10,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              // Container(
              //   decoration: BoxDecoration(
              //     border: Border.all(color: Colors.grey, width: 1.0),
              //     color: Colors.grey,
              //     // borderRadius: BorderRadius.circular(10),
              //   ),
              // ),
              FractionallySizedBox(
                widthFactor: 3,
                heightFactor: widget.percent,
                child: Container(
                  decoration: BoxDecoration(
                    color: widget.color,
                    // borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(widget.label),
      ],
    );

}

