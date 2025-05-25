class ArticleModel {
   final String? image;
   final String title;
   final String? subTitle;
  ArticleModel(
      {required this.image, required this.subTitle, required this.title});
factory ArticleModel.fronJson(json){
  return ArticleModel(image: json["urlToImage"],
    subTitle: json["description"],
    title: json["title"],);

}
}
