import 'package:bottom_indicator_bar/bottom_indicator_bar.dart';
import 'package:dhiaeddine_belkhiria/app/shared_widgets/custom_navigation/slide_left_route.dart';
import 'package:dhiaeddine_belkhiria/app/shared_widgets/custom_text.dart';
import 'package:dhiaeddine_belkhiria/ui/views/auth/login/login_view.dart';
import 'package:dhiaeddine_belkhiria/ui/views/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:dhiaeddine_belkhiria/app/utils/colors.dart' as colors;

class HomeView extends StatefulWidget {

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.grey[100],
        body: Container(),
        // bottomNavigationBar: BottomIndicatorBar(
        //   onTap: (index) => {},
        //   items: model.items,
        //   activeColor: Colors.teal,
        //   inactiveColor: Colors.grey,
        //   indicatorColor: Colors.teal,
        // ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(bottom: 20),
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
             Stack(
               children: [
                 SvgPicture.asset("assets/icons/Home Gray color.svg"),
                 Positioned(child: Container())
               ],
             ),
              SvgPicture.asset("assets/icons/Block.svg"),
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: colors.primaryColor,
                  shape: BoxShape.circle
                ),
                child: Icon(Icons.add,color: Colors.white,),
              ),
              SvgPicture.asset("assets/icons/Block.svg"),
              SvgPicture.asset("assets/icons/Block.svg"),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
