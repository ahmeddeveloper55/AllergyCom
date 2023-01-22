class ModelClass {
  String _id;
  String des;
  String imgUrl;
  String title;
  String url;

  ModelClass(
      {
        this.title,
        this.des,
        this.url,
        this.imgUrl});

  ModelClass.fromJson(Map<String, dynamic> json) {
    title = json['title'] ?? "";
    des = json['des']?? " ";
    imgUrl = json['imgurl']?? "";
    url = json['url']?? "";

  }

}



