import 'dart:convert';

class UserDto {
  int id;
  String username;

  UserDto({
    required this.id,
    required this.username,
  });

  factory UserDto.fromMap(Map<String, dynamic> map) => UserDto(
        id: map["id"],
        username: map["username"],
      );

  factory UserDto.fromJson(String json) => UserDto.fromMap(jsonDecode(json));
}
