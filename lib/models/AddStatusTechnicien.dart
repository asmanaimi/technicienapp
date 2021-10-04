import 'package:json_annotation/json_annotation.dart';
part 'AddStatusTechnicien.g.dart';
@JsonSerializable()

class AddStatusTechnicien{
  
String email;
  String name;
  String adress;
  String cin;
String tel;
String status;

@JsonKey(name: "_id")
  String id;
  AddStatusTechnicien(
      {
        this.name,
      this.email,
      this.adress,
           this.id, 
     this.tel,
     
      this.status,
//       String selectedType,
    });
 factory AddStatusTechnicien.fromJson(Map<String, dynamic> json) =>
      _$AddStatusTechnicienFromJson(json);
  Map<String, dynamic> toJson() => _$AddStatusTechnicienToJson(this);
}