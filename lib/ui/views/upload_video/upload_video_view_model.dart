import 'package:dhiaeddine_belkhiria/app/shared_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stacked/stacked.dart';
import 'package:dhiaeddine_belkhiria/app/utils/router.dart' as route;

class UploadVideoViewModel extends BaseViewModel {
  bool _uploadBtnClicked = false;
  bool get uploadBtnClicked => _uploadBtnClicked;
  final fToast = FToast();

  showSuccessToast(context) {
    Widget toast = InkWell(
      onTap: (){
        fToast.removeQueuedCustomToasts();
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(
                  0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 15,right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset("assets/icons/check.svg"),
                  const SizedBox(width: 10,),
                  CustomText(
                    text: "Your video has been uploaded",
                    size: 14,
                  ),
                ],
              ),
              SvgPicture.asset("assets/icons/Close.svg"),
            ],
          ),
        ),
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration:const Duration(seconds: 2),
    );

    // Custom Toast Position
  }

  changeBtnClickedValue(context) {
    _uploadBtnClicked = true;
    fToast.init(context);
    Future.delayed(const Duration(milliseconds: 1500)).then((value) {
      showSuccessToast(context);
      Navigator.of(context)
          .pushNamedAndRemoveUntil(route.homeScreenRoute, (route) => false);
    });
    notifyListeners();
  }

}