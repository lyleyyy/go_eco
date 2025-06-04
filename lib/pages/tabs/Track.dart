import 'package:flutter/material.dart';
import 'dart:io';
import 'package:go_eco/app_theme.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:go_eco/fitness_app/fitness_app_home_screen.dart';

class TrackPage extends StatefulWidget {
  const TrackPage({super.key});

  @override
  _TrackPageState createState() => _TrackPageState();
}

class _TrackPageState extends State<TrackPage> {
  @override
  Widget build(BuildContext context) {
    return FitnessAppHomeScreen();
  }
}