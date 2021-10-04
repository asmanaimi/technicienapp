import 'package:json_annotation/json_annotation.dart';
part 'AddOrdoModel.g.dart';
@JsonSerializable()

class AddOrdoModel{
  
String email;
  String medecin;
  String priseencharge;
  String listp;
String coverImage;
String technicien;
String status;

@JsonKey(name: "_id")
  String id;
  AddOrdoModel(
      {
        this.medecin,
      this.email,
      this.priseencharge,
           this.id, 
     this.listp,
      this.coverImage,
      this.technicien,
      this.status,
//       String selectedType,
    });
 factory AddOrdoModel.fromJson(Map<String, dynamic> json) =>
      _$AddOrdoModelFromJson(json);
  Map<String, dynamic> toJson() => _$AddOrdoModelToJson(this);
}