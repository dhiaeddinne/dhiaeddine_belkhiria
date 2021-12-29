class PostModel {
  late String userName;
  late String userImage;
  late String postDescription;
  late String videoUrl;
  late String videoTitle;
  late String postedDate;

  PostModel(
      {required this.postDescription,
      required this.userName,
      required this.videoTitle,
      required this.videoUrl,
      required this.postedDate,
      required this.userImage});
}
