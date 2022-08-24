import 'package:get/get.dart';
import 'package:todoex/model/dto/common/res_dto.dart';
import 'package:todoex/model/dto/post/post_dto.dart';
import 'package:todoex/model/repository/post_repository.dart';
import 'package:todoex/view/modules/post/post.dart';

class PostViewModel extends GetxController {
  static PostViewModel get to => Get.find();
  final PostRepository postRepositoty = Get.put(PostRepository());

  final RxList<Post> _postList = <Post>[].obs;

  @override
  void onInit() {
    _getList();
    super.onInit();
  }

  Future<void> _getList() async {
    ResDto<List<PostDto>?> getPostDto = await postRepositoty.getList();
  }

  Future<void> _getPost(int id) async {}
}
