import 'package:dhiaeddine_belkhiria/ui/views/videos_list/video_list_model_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:dhiaeddine_belkhiria/app/shared_widgets/custom_text.dart';
import 'package:dhiaeddine_belkhiria/app/utils/colors.dart' as colors;

class VideoListView extends StatefulWidget {
  final bool? showVideoList;

  VideoListView({this.showVideoList});

  @override
  _VideoListViewState createState() => _VideoListViewState();
}

class _VideoListViewState extends State<VideoListView> {
  VideoListViewModel videoListViewModel = VideoListViewModel();
  ScrollController controller = ScrollController();

  @override
  void initState() {
    /// for the infinity scroll pagination

    controller = ScrollController()..addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {
    if (controller.position.pixels == controller.position.maxScrollExtent) {
      videoListViewModel.getMoreItems();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VideoListViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: SingleChildScrollView(
          /// I used ScrollPhysics in order to make the page scrollable and not confuse with the listview
          physics: ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    )),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: ListTile(
                      leading: Container(
                        height: 59,
                        width: 59,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: colors.primaryColor, width: 3),
                            shape: BoxShape.circle),
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Image.asset(
                            "assets/images/person.png",
                            width: 49,
                            height: 49,
                          ),
                        ),
                      ),
                      title: CustomText(
                        text: "Daniela Fernández Ramos ",
                        color: colors.textColor,
                        weight: FontWeight.bold,
                      ),
                      subtitle: CustomText(
                        text: "Lorem ipsum dolor sit amet",
                        color: colors.lightGreyColor,
                      ),
                      trailing: SvgPicture.asset("assets/icons/Search.svg"),
                    ),
                  ),
                ),
              ),
              widget.showVideoList == true
                  ? ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.only(top: 20),
                      itemCount: model.allPosts.length + 1,
                      controller: controller,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, index) {
                        if (index < model.allPosts.length) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25),
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
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    /// Card Header
                                    ListTile(
                                      leading: Container(
                                        height: 59,
                                        width: 59,
                                        child: Padding(
                                          padding: const EdgeInsets.all(4),
                                          child: Image.asset(
                                            model.allPosts[index].userImage,
                                            width: 49,
                                            height: 49,
                                          ),
                                        ),
                                      ),
                                      title: CustomText(
                                        text: model.allPosts[index].userName,
                                        size: 15,
                                        color: colors.textColor,
                                        weight: FontWeight.bold,
                                      ),
                                      subtitle: Row(
                                        children: [
                                          const Icon(
                                            Icons.public,
                                            size: 9,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          CustomText(
                                            text: model
                                                .allPosts[index].postedDate,
                                            size: 10,
                                          )
                                        ],
                                      ),
                                      trailing: SizedBox(
                                        width: 70,
                                        child: Row(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(6),
                                              decoration: BoxDecoration(
                                                color: Colors.grey[300],
                                                shape: BoxShape.circle,
                                              ),
                                              child: SvgPicture.asset(
                                                  "assets/icons/Star.svg"),
                                              width: 25,
                                              height: 25,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  left: 1, right: 1),
                                              decoration: BoxDecoration(
                                                color: Colors.grey[300],
                                                shape: BoxShape.circle,
                                              ),
                                              child: const Center(
                                                  child: Icon(
                                                Icons.more_horiz,
                                                size: 18,
                                              )),
                                              width: 25,
                                              height: 25,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),

                                    /// Card body
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 0, 15, 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          CustomText(
                                              size: 14,
                                              text: model.allPosts[index]
                                                  .postDescription),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Stack(
                                            children: [
                                              Image.asset(model
                                                  .allPosts[index].videoUrl),
                                              Image.asset(
                                                  "assets/images/video_image.png"),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          CustomText(
                                              text: model
                                                  .allPosts[index].videoTitle),
                                        ],
                                      ),
                                    ),

                                    /// Card footer
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 10, 10, 0),
                                      child: Row(
                                        children: [
                                          footerIconWidget(
                                              imagePath:
                                                  "assets/icons/Like.svg"),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          footerIconWidget(
                                              imagePath:
                                                  "assets/icons/Comment.svg"),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          footerIconWidget(
                                              imagePath:
                                                  "assets/icons/share.svg"),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        } else if (model.isSearching) {
                          ///  loader while fetching new data
                          return Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 1,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  colors.loaderColor),
                            ),
                          );
                        } else {
                          return Container();
                        }
                      })
                  : Container(
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 50, right: 50),
                          child: CustomText(
                            text:
                                "Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet",
                            textAlign: TextAlign.justify,
                            color: colors.lightGreyColor,
                          ),
                        ),
                      ),
                    )
            ],
          ),
        ),
      ),
      viewModelBuilder: () => VideoListViewModel(),
    );
  }

  Widget footerIconWidget({required String imagePath}) {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: SvgPicture.asset(imagePath),
      width: 34,
      height: 34,
    );
  }
}
