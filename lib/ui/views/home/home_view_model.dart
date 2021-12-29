import 'package:bottom_indicator_bar/bottom_indicator_bar.dart';
import 'package:dhiaeddine_belkhiria/app/shared_widgets/custom_text.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:dhiaeddine_belkhiria/app/models/post_model.dart';

class HomeViewModel extends BaseViewModel {
  final String _title = 'HomeViewModel';

  String get title => _title;


  final List<BottomIndicatorNavigationBarItem> items = [
    BottomIndicatorNavigationBarItem(icon: Icons.home),
    BottomIndicatorNavigationBarItem(icon: Icons.search),
    BottomIndicatorNavigationBarItem(icon: Icons.search),
    BottomIndicatorNavigationBarItem(icon: Icons.search),
    BottomIndicatorNavigationBarItem(icon: Icons.settings),
  ];


}
