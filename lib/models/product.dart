import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';
@JsonSerializable()

class Product {
  late String title;
  late String id;
  late double price;
  late String image;
  late String description;
  late String category;

  // @JsonKey(defaultValue: '')
  Product(
    this.title,
    this.id,
    this.price,
    this.image,
    this.description,
    this.category,
  );

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
