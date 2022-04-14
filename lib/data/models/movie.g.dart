// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      charId: json['charId'] as int?,
      name: json['name'] as String?,
      birthday: json['birthday'] as String?,
      occupation: (json['occupation'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      img: json['img'] as String?,
      status: json['status'] as String?,
      nickname: json['nickname'] as String?,
      appearance:
          (json['appearance'] as List<dynamic>?)?.map((e) => e as int).toList(),
      portrayed: json['portrayed'] as String?,
      category: json['category'] as String?,
      betterCallSaulAppearance:
          (json['betterCallSaulAppearance'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList(),
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'charId': instance.charId,
      'name': instance.name,
      'birthday': instance.birthday,
      'occupation': instance.occupation,
      'img': instance.img,
      'status': instance.status,
      'nickname': instance.nickname,
      'appearance': instance.appearance,
      'portrayed': instance.portrayed,
      'category': instance.category,
      'betterCallSaulAppearance': instance.betterCallSaulAppearance,
    };
