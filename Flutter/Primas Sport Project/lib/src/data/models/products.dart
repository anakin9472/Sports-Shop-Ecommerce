part of models;

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  final String productId, image, title, price;
  final Color bgColor;

  Product({
    required this.productId,
    required this.image,
    required this.title,
    required this.price,
    this.bgColor = const Color(0xFFEFEFF2),
    this.body,
  });

  String? body;
  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["productId"].toString(),
        title: json["title"],
        price: json["price"],
        image: json["image"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "title": title,
        "price": price,
        "image": image,
        "body": body,
      };
}



// List<Product> products = [
//   Product(
//     image: "assets/images/product_0.png",
//     title: "Long Sleeve Shirts",
//     price: 165000,
//     bgColor: const Color(0xFFFEFBF9),
//   ),
//   Product(
//     image: "assets/images/product_1.png",
//     title: "Casual Henley Shirts",
//     price: 99000,
//   ),
//   Product(
//     image: "assets/images/product_2.png",
//     title: "Curved Hem Shirts",
//     price: 180000,
//     bgColor: const Color(0xFFF8FEFB),
//   ),
//   Product(
//     image: "assets/images/product_3.png",
//     title: "Casual Nolin T-Shirts",
//     price: 149000,
//     bgColor: const Color(0xFFEEEEED),
//   ),
// ];
