class Dish {
  int? id;
  String? dishname;
  String? discription;
  String? image;
  String? price;

  Dish(this.id, this.dishname, this.discription, this.image, this.price);

  factory Dish.fromJson(Map<String, dynamic> json) {
    return Dish(json["id"], json["dishname"], json["discription"],
        json["image"], json["price"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "dishname": dishname,
      "discription": discription,
      "image": image,
      "price": price,
    };
  }
}
