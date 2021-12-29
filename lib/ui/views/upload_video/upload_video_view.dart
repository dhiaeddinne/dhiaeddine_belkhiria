import 'package:dhiaeddine_belkhiria/app/globalization/globalizationManager.dart';
import 'package:dhiaeddine_belkhiria/app/shared_widgets/custom_button.dart';
import 'package:dhiaeddine_belkhiria/app/shared_widgets/custom_text.dart';
import 'package:dhiaeddine_belkhiria/ui/views/upload_video/upload_video_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:dhiaeddine_belkhiria/app/utils/colors.dart' as colors;

class UploadVideoView extends StatefulWidget {
  const UploadVideoView({Key? key}) : super(key: key);

  @override
  _UploadVideoViewState createState() => _UploadVideoViewState();
}

class _UploadVideoViewState extends State<UploadVideoView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UploadVideoViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
          appBar: !model.uploadBtnClicked ? AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset("assets/icons/Back.svg"),
            ),
            elevation: 0,
            title: CustomText(
              text: GlobalizationManager.of(context)
                  .getMessage("title", "upload_video"),
              weight: FontWeight.w500,
              size: 22,
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(4.0),
              child: Container(
                color: colors.lightGreyColor,
                height: 1.0,
              ),
            ),
          ):null,
          body: model.uploadBtnClicked
              ? SpinKitFadingCircle(
                  color: colors.loaderColor,
                  size: 50.0,
                )
              : Padding(
                  padding: const EdgeInsets.fromLTRB(25, 35, 25, 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: GlobalizationManager.of(context)
                            .getMessage("title", "video_title"),
                        size: 15,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      videoTitle(uploadVideoViewModel: model),
                      CustomText(
                        text: GlobalizationManager.of(context)
                            .getMessage("title", "description"),
                        size: 15,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      videoDescription(uploadVideoViewModel: model),
                      const SizedBox(
                        height: 40,
                      ),
                      Center(
                          child: uploadVideoButton(uploadVideoViewModel: model))
                    ],
                  ),
                )),
      viewModelBuilder: () => UploadVideoViewModel(),
    );
  }

  Widget videoTitle({required UploadVideoViewModel uploadVideoViewModel}) {
    return SizedBox(
      height: 66,
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          filled: true,
          fillColor: colors.inputBgColor,
          hintText: GlobalizationManager.of(context)
              .getMessage("title", "video_title"),
          contentPadding:
              const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colors.inputBgColor),
            borderRadius: BorderRadius.circular(2.0),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: colors.inputBgColor),
            borderRadius: BorderRadius.circular(2.0),
          ),
        ),
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.text,
      ),
    );
  }

  Widget videoDescription(
      {required UploadVideoViewModel uploadVideoViewModel}) {
    return SizedBox(
      height: 66,
      child: TextFormField(
        maxLines: 4,
        minLines: 4,
        decoration: InputDecoration(
          border: InputBorder.none,
          filled: true,
          fillColor: colors.inputBgColor,
          hintText: GlobalizationManager.of(context)
              .getMessage("title", "description"),
          contentPadding:
              const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colors.inputBgColor),
            borderRadius: BorderRadius.circular(2.0),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: colors.inputBgColor),
            borderRadius: BorderRadius.circular(2.0),
          ),
        ),
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.text,
      ),
    );
  }

  Widget uploadVideoButton(
      {required UploadVideoViewModel uploadVideoViewModel}) {
    return CustomButton(
        width: 181,
        height: 53,
        text: GlobalizationManager.of(context).getMessage("Button", "upload"),
        btnColor: colors.buttonColor,
        borderRadius: 8,
        onTapFunction: () {
          uploadVideoViewModel.changeBtnClickedValue(context);
        });
  }
}
