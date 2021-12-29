import 'package:dhiaeddine_belkhiria/ui/views/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:dhiaeddine_belkhiria/app/utils/colors.dart' as colors;

class HomeView extends StatefulWidget {
  final bool? showVideoList;
  HomeView({this.showVideoList});
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
          backgroundColor: Colors.grey[100],
          body: widget.showVideoList == true?
          model.homeContentWithVideoList.elementAt(model.selectedIndex):
          model.homeContentWithoutVideoList.elementAt(model.selectedIndex),
          bottomNavigationBar: SizedBox(
            height: 70,
            child: BottomNavigationBar(
                selectedFontSize: 0,
                type: BottomNavigationBarType.fixed,
                currentIndex: model.selectedIndex,
                onTap: (index){
                  model.onItemTapped(index);
                },
                items: [
              BottomNavigationBarItem(
                  icon: Column(
                    children: [
                     model.selectedIndex==0?
                     SvgPicture.asset("assets/icons/Home Black color.svg"):
                     SvgPicture.asset("assets/icons/Home Gray color.svg"),
                    ],
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/icons/Block.svg"), label: ""),
              BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      Center(
                        child: Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                              color: colors.primaryColor, shape: BoxShape.circle),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/icons/Block.svg"), label: ""),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/icons/Block.svg"), label: ""),
            ]),
          )
          ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
