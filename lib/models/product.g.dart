// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      json['title'] as String,
      json['id'] as String,
      (json['price'] as num).toDouble(),
      json['image'] as String,
      json['description'] as String,
      json['category'] as String,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'title': instance.title,
      'id': instance.id,
      'price': instance.price,
      'image': instance.image,
      'description': instance.description,
      'category': instance.category,
    };
