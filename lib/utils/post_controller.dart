class PostController {
  String id;
  String title;
  var price;
  String v;

  PostController(this.id, this.title, this.price, this.v);

  PostController.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    title = json['description'];
    price = json['price'];
    v = json["_v"];
  }

}
