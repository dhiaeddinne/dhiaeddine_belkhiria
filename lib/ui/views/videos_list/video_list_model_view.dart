import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:dhiaeddine_belkhiria/app/models/post_model.dart';

class VideoListViewModel extends BaseViewModel {
  ScrollController scrollController = ScrollController();
  bool _isSearching = false;

  bool get isSearching => _isSearching;

  List<PostModel> allPosts = [
    PostModel(
        postDescription:
            "Lorem ipsum dolor sit amet, consetetur sadipscing  😍",
        userName: "Daniela Fernández Ramos",
        videoTitle: "Video Name 1",
        videoUrl: "assets/images/girl.png",
        postedDate: "1 minutes",
        userImage: "assets/images/person.png"),
    PostModel(
        postDescription:
            "Lorem ipsum dolor sit amet, consetetur sadipscing  😍",
        userName: "Lorem ipsum",
        postedDate: "4 days ago",
        videoTitle: "Video Name",
        videoUrl: "assets/images/nature.png",
        userImage: "assets/images/person.png"),
  ];

  getMoreItems() {
    _isSearching = true;
    allPosts.add(
      PostModel(
          postDescription:
              "Lorem ipsum dolor sit amet, consetetur sadipscing  😍",
          userName: "Lorem ipsum",
          postedDate: "4 days ago",
          videoTitle: "Video Name",
          videoUrl: "assets/images/nature.png",
          userImage: "assets/images/person.png"),
    );
    notifyListeners();
  }
}
