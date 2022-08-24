import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoex/view_model/post_view_model.dart';

class Post extends StatelessWidget {
  const Post({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final postViewModel = Get.put(PostViewModel());
    return Scaffold(
      appBar: AppBar(
        title: Text('통신테스트'),
      ),
      body: Text('//'),
    );
  }
}
