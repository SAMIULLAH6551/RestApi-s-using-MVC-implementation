import 'dart:convert';

import 'package:all_rest_apis/models/post_model.dart';
import 'package:all_rest_apis/models/users_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/image_model.dart';

class GetApiController extends GetxController {
  List<PostModel> postList = [];
  List<ImageModel> imageList = [];
  List<UserModel> userList = [];

  Future<List<PostModel>> getApiPosts() async {
    final responce =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(responce.body.toString());
    if (responce.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        postList.add(PostModel.fromJson(i));
      }
      return postList;
    } else {
      return postList;
    }
  }

  Future<List<ImageModel>> getApiImages() async {
    final responce = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(responce.body.toString());

    print("Data Responce of Api is ");
    print(data);

    if (responce.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        ImageModel imageModel = ImageModel(
            albumId: i["albumId"],
            id: i["id"],
            title: i["title"],
            url: i["url"],
            thumbnailUrl: i["thumbnailUrl"]);
        imageList.add(imageModel);
      }
      return imageList;
    } else {
      return imageList;
    }
  }

  Future<List<UserModel>> getApiUsers() async {
    final responce =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    var data = jsonDecode(responce.body.toString());
    print(data);
    if (responce.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        userList.add(UserModel.fromJson(i));
        print(userList);
      }
      return userList;
    } else {
      return userList;
    }
  }
}
