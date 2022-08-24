import 'dart:convert';

import 'package:get/get_connect.dart';
import 'package:todoex/model/dto/common/res_dto.dart';
import 'package:todoex/model/dto/post/post_dto.dart';
import 'package:todoex/utils/constants.dart';

class PostRepository extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = "${Constants.baseUrl}/post";

    // request에 추가시키고 싶을 떄 (공통헤더)
    httpClient.addRequestModifier<dynamic>((request) {
      request.headers["Authorization"] = 'token';
      return request;
    });
  }

  Future<ResDto<List<PostDto>?>> getList() async {
    Response response = await get('');

    // 정상 통신
    if (response.statusCode == 200) {
      final Map<String, dynamic> decodedResponse = jsonDecode(response.bodyString!);
      return ResDto<List<PostDto>>(
        code: decodedResponse["code"],
        message: decodedResponse["message"],
        result: (decodedResponse["result"] as List).map((e) => PostDto.fromMap(e)).toList(),
      );
      // 토큰을 보내지 않았을경우
    } else if (response.statusCode == 401) {
      final Map<String, dynamic> decodedResponse = jsonDecode(response.bodyString!);
      return ResDto<List<PostDto>>(
        code: decodedResponse["code"],
        message: decodedResponse["message"],
      );
    }
    // 없는 id를 보냈을 경우
    else if (response.statusCode == 400) {
      final Map<String, dynamic> decodedResponse = jsonDecode(response.bodyString!);
      return ResDto<List<PostDto>>(
        code: decodedResponse["code"],
        message: decodedResponse["message"],
      );
    } else {
      //아예 통신이 안되었을 경우 -> 초반에 세팅했던 code = -1이 들어감
      return ResDto();
    }
  }

  Future<ResDto<PostDto?>> getPostItem(int id) async {
    Response response = await get('/${id}');

    // 정상 통신
    if (response.statusCode == 200) {
      final Map<String, dynamic> decodedResponse = jsonDecode(response.bodyString!);
      return ResDto<PostDto>(
        code: decodedResponse["code"],
        message: decodedResponse["message"],
        result: PostDto.fromMap(decodedResponse["result"]),
      );
      // 토큰을 보내지 않았을경우
    } else if (response.statusCode == 401) {
      final Map<String, dynamic> decodedResponse = jsonDecode(response.bodyString!);
      return ResDto<PostDto>(
        code: decodedResponse["code"],
        message: decodedResponse["message"],
      );
    }
    // 없는 id를 보냈을 경우
    else if (response.statusCode == 400) {
      final Map<String, dynamic> decodedResponse = jsonDecode(response.bodyString!);
      return ResDto<PostDto>(
        code: decodedResponse["code"],
        message: decodedResponse["message"],
      );
    } else {
      return ResDto();
    }
  }
}
