import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import '../models/activity.dart';

class ActivitiesList extends StatelessWidget {
  final List<Activity> activities;

  ActivitiesList(this.activities);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: activities.isEmpty
          ? Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Text('No Activities Added Yet!',
                    style: Theme.of(context).textTheme.titleLarge),
                SizedBox(
                  height: 50,
                ),
                // Container(
                //   height: 200,
                //   child: Image.asset(
                //     'assets/images/waiting.png',
                //     fit: BoxFit.cover,
                //   ),
                // ),
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Colors.green,
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              activities[index].icon,
                              size: 40,
                              color: Colors.green,
                            ),
                            // Text(
                            //   ': ${activities[index].amount.toString()}',
                            //   // a.amount.toString(),
                            //   style: TextStyle(
                            //     fontWeight: FontWeight.bold,
                            //     fontSize: 20,
                            //     color: Colors.green,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            activities[index].title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            activities[index].description,
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                            // border: Border.all(
                            //   width: 2,
                            //   color: Colors.green,
                            // ),
                            ),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.grass,
                              size: 40,
                              color: Colors.green,
                            ),
                            Text(
                              ': ${activities[index].amount.toString()}',
                              // a.amount.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: activities.length,
            ),
    );
  }
}
