import 'package:json_annotation/json_annotation.dart';

part 'NotificationM.g.dart';

@JsonSerializable()
class NotificationM {
 
  String title;
  String body;
  NotificationM(
      {this.title,
      this.body,
      });

  factory NotificationM.fromJson(Map<String, dynamic> json) =>
      _$NotificationMFromJson(json);
  Map<String, dynamic> toJson() => _$NotificationMToJson(this);
}