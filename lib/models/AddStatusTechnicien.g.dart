// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AddStatusTechnicien.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddStatusTechnicien _$AddStatusTechnicienFromJson(Map<String, dynamic> json) {
  return AddStatusTechnicien(
    name: json['name'] as String,
    email: json['email'] as String,
    adress: json['adress'] as String,
    id: json['_id'] as String,
    tel: json['tel'] as String,
    status: json['status'] as String,
  )..cin = json['cin'] as String;
}

Map<String, dynamic> _$AddStatusTechnicienToJson(
        AddStatusTechnicien instance) =>
    <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'adress': instance.adress,
      'cin': instance.cin,
      'tel': instance.tel,
      'status': instance.status,
      '_id': instance.id,
    };
