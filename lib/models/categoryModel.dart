class CategoryModel {
  String title;
  String imgUrl;
  CategoryModel(this.title, this.imgUrl);

  CategoryModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        imgUrl = json['imgUrl'];

  Map<String, dynamic> toJson() =>
      {'title': title, 'imgUrl': imgUrl};
}
