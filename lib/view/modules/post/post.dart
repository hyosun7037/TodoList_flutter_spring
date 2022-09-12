import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoex/view_model/post_view_model.dart';

class Post extends StatelessWidget {
  const Post({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final postViewModel = Get.put(PostViewModel());
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white70,
        title: Text(
          '통신테스트',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: 300,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 250,
                        child: TextField(
                          // controller 영역
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(horizontal: 15),
                              border: OutlineInputBorder(),
                              labelText: '할일을 입력해주세요'),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.center,
                          width: 70,
                          height: 50,
                          color: Colors.amber,
                          child: Text(
                            '등록',
                            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                          ),
                        ),
                      )
                    ],
                  ),
                  // 할일리스트
                  Expanded(child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return Row(children: [
                        Checkbox(
                            value: true,
                            onChanged: (val) {
                              print(val);
                            })
                        //
                      ]);
                    },
                  ))
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              color: Colors.white,
              width: double.infinity,
              height: 500,
              padding: EdgeInsets.all(20),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    '할일완료',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 20),
                  Expanded(child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          Checkbox(
                              value: true,
                              onChanged: (val) {
                                print(val);
                              }),
                          //
                          GestureDetector(
                            onTap: () {},
                            child: Icon(Icons.close),
                          )
                        ],
                      );
                    },
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
