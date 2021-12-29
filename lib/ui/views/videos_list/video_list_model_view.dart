import 'package:dhiaeddine_belkhiria/app/shared_widgets/custom_text.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:dhiaeddine_belkhiria/app/models/post_model.dart';

class VideoListViewModel extends BaseViewModel {
  final String _title = 'StartUpViewModel';
  String get title => _title;

  FToast fToast = FToast();

  List<PostModel> allPosts = [
    PostModel(
        postDescription:
        "Lorem ipsum dolor sit amet, consetetur sadipscing  😍",
        userName: "Daniela Fernández Ramos",
        videoTitle: "Video Name 1",
        videoUrl: "serr",
        postedDate: "1 minutes",
        userImage: "assets/images/person.png"),
    PostModel(
        postDescription:
        "Lorem ipsum dolor sit amet, consetetur sadipscing  😍",
        userName: "Lorem ipsum",
        postedDate: "now",
        videoTitle: "Video Name",
        videoUrl: "serr",
        userImage: "assets/images/person.png"),
  ];

  initFloatToast() {
    Fluttertoast.showToast(
      msg: "GeeksforGeeks",
      backgroundColor: Colors.grey,
      // fontSize: 25
      // gravity: ToastGravity.TOP,
      // textColor: Colors.pink
    );
  }

  showToast() {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.0),
        color: Colors.white,
      ),
      child: ListTile(
          trailing: SvgPicture.asset("assets/icons/Close.svg"),
          title: CustomText(
            text: "Your video has been uploaded",
            size: 14,
          ),
          leading: SvgPicture.asset("assets/icons/check.svg")),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
    );

    // Custom Toast Position
    fToast.showToast(
        child: toast,
        toastDuration: const Duration(seconds: 2),
        positionedToastBuilder: (context, child) {
          return Positioned(
            child: child,
            top: 16.0,
            left: 16.0,
          );
        });
  }

}