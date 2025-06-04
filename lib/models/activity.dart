import 'package:flutter/material.dart';
// import 'package:flutter/foundation.dart';

class Activity {
  String id;
  String title;
  int amount;
  String description;
  IconData icon;

  Activity({
    required this.id,
    required this.title,
    required this.amount,
    required this.description,
    required this.icon,
  });
}
