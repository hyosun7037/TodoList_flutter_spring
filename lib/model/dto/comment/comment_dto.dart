import 'dart:convert';

import 'package:todoex/model/dto/user/user_dto.dart';

class CommentDto {
  int id;
  UserDto userDto;
  String content;
  DateTime createDate;

  CommentDto({
    required this.id,
    required this.userDto,
    required this.content,
    required this.createDate,
  });

  factory CommentDto.fromMap(Map<String, dynamic> map) => CommentDto(
        id: map["id"],
        userDto: UserDto.fromMap(map["userDto"]),
        content: map["content"],
        createDate: map["createDate"],
      );

  factory CommentDto.fromJson(String json) => CommentDto.fromMap(jsonDecode(json));
}
