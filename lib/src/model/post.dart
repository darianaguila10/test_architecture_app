import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part "post.g.dart";
@JsonSerializable()

class Post extends Equatable {
  late final id;
  late final title;
  late final body;
  Post(this.id, this.title, this.body);

  @override
  List<Object?> get props => [id, title, body];

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

   Map<String, dynamic> toJson() => _$PostToJson(this);


}
