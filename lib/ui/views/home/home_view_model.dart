import 'package:dhiaeddine_belkhiria/ui/views/upload_video/upload_video_view.dart';
import 'package:dhiaeddine_belkhiria/ui/views/videos_list/video_list_view.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends BaseViewModel {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  // Home content with video list, because the list is not dynamic so I just control the display of the video list with boolean value
  List<Widget> homeContentWithVideoList = [
    VideoListView(
      showVideoList: true,
    ),
    Container(),
    UploadVideoView(),
    Container(),
    Container(),
  ];

  List<Widget> homeContentWithoutVideoList = [
    VideoListView(),
    Container(),
    UploadVideoView(),
    Container(),
    Container(),
  ];

  void onItemTapped(int index) {
    if (index == 1 || index == 3 || index == 4) {
      return;
    } else {
      _selectedIndex = index;
      notifyListeners();
    }
  }
}
