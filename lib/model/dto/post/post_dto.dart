import 'dart:convert';

import 'package:todoex/model/dto/comment/comment_dto.dart';
import 'package:todoex/model/dto/user/user_dto.dart';

class PostDto {
  int id;
  String title;
  String content;
  UserDto userDto;
  List<CommentDto> commentDtoList;
  DateTime createDate;

  PostDto({
    required this.id,
    required this.title,
    required this.content,
    required this.userDto,
    required this.commentDtoList,
    required this.createDate,
  });

  factory PostDto.fromMap(Map<String, dynamic> map) => PostDto(
        id: map["id"],
        title: map["title"],
        content: map["content"],
        userDto: UserDto.fromMap(map["user"]),
        commentDtoList: (map["commentList"] as List).map((e) => CommentDto.fromMap(e)).toList(),
        createDate: map["createDate"],
      );

  factory PostDto.fromJson(String json) => PostDto.fromMap(jsonDecode(json));
}
