import 'dart:io';

import 'package:all_rest_apis/controllers/post_api_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataPosting extends StatelessWidget {
  DataPosting({Key? key}) : super(key: key);

  final PostController postController = PostController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Data and Image Posting"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Obx(() {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(100)),
                      ),
                      width: 200,
                      height: 200,
                      child: postController.image.value == null
                          ? Center(
                              child: Text("No Image Selected"),
                            )
                          : ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                              child: Image.file(
                                File(postController.image.value!.path).absolute,
                                fit: BoxFit.cover,
                              ),
                            ),
                    );
                  }),
                  Padding(
                    padding: const EdgeInsets.only(top: 155, left: 170),
                    child: IconButton(
                        onPressed: () {
                          postController.getImage();
                        },
                        icon: const Icon(Icons.edit)),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    postController.uploadImage();
                  },
                  child: Text("Upload")),
            ],
          ),
        ));
  }
}
