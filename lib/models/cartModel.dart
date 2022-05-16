class CartModel {
  String imgUrl;
  String desc;
  int quantity;
  CartModel(this.imgUrl,this.desc,this.quantity);

  CartModel.fromJson(Map<String, dynamic> json)
      : imgUrl = json['imgUrl'],
        desc = json['desc'],
        quantity = json["quantity"];

  Map<String, dynamic> toJson() => {
        'imgUrl': imgUrl,
        'desc': desc, 
        "quantity" : quantity
      };
}
