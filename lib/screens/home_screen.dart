import 'package:all_rest_apis/controllers/post_api_controller.dart';
import 'package:all_rest_apis/screens/post_apis/post_api_data_posting.dart';
import 'package:all_rest_apis/screens/post_apis/post_api_signup_user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'covid_19/covid_live_update.dart';
import 'get_apis/get_api_images.dart';
import 'get_apis/get_api_posts.dart';
import 'get_apis/get_api_users.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final PostController postController = PostController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PlaceHolder fake Apis for Learning"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Get APis",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(GetApiPosts());
                },
                child: const Text("Get Api Posts"),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => GetApiImages());
                },
                child: const Text("Get Api Images"),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => GetApiUsers());
                },
                child: const Text("Get Api Users"),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Post APis",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => PostApiSignup());
                },
                child: const Text("Post Api SignUp & Login User"),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => DataPosting());
                },
                child: const Text("upload Image Using Post APis"),
              ),
              ElevatedButton(
                onPressed: () {
                  postController.uploadData();
                },
                child: const Text("upload Data using PostApi"),
              ),
              const SizedBox(
                height: 30,
              ),
              const Divider(color: Colors.black),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => CovidUpdate());
                },
                child: const Text("Covid 19 Live Updated Data Api"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
