import 'package:flutter/material.dart';
// import 'package:flutter/foundation.dart';

class ActivitySelect {
  String name;
  String description;
  bool isSelected;
  IconData icon;
  int amount;

  ActivitySelect(
    this.name,
    this.description,
    this.isSelected,
    this.icon,
    this.amount,
  );
}
