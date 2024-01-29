import 'package:ecommerce_app/models/product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart.g.dart';

@JsonSerializable()
class Cart extends Product {
  int count = 0;
  Cart(
    String title,
    String id,
    double price,
    String image,
    String description,
    String category,
  ) : super(title, id, price, image, description, category);

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}
