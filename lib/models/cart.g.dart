// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cart _$CartFromJson(Map<String, dynamic> json) => Cart(
      json['title'] as String,
      json['id'] as String,
      (json['price'] as num).toDouble(),
      json['image'] as String,
      json['description'] as String,
      json['category'] as String,
    )..count = json['count'] as int;

Map<String, dynamic> _$CartToJson(Cart instance) => <String, dynamic>{
      'title': instance.title,
      'id': instance.id,
      'price': instance.price,
      'image': instance.image,
      'description': instance.description,
      'category': instance.category,
      'count': instance.count,
    };
