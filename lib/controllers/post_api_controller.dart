import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class PostController extends GetxController {
  Rx<File?> image = Rx(null);
  final _picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image.value = File(pickedFile.path);
      print("ImageValue : ${image.value}");
      update();
    } else {
      print('No image selected.');
    }
  }

  void registerUser(String email, password) async {
    try {
      http.Response response = await http.post(
          Uri.parse('https://reqres.in/api/register'),
          body: {"email": email, "password": password});
      if (response.statusCode == 200) {
        Get.snackbar('Post Api', "Account created Successfully");
        var data = jsonDecode(response.body.toString());
        print(data['token']);
      } else {
        Get.snackbar('Post Api', "Failed");
      }
    } catch (e) {
      print(e);
    }
  }

  void loginUser(String email, password) async {
    try {
      http.Response response = await http.post(
          Uri.parse('https://reqres.in/api/login'),
          body: {"email": email, "password": password});

      if (response.statusCode == 200) {
        Get.snackbar("Post Api", "User logged in Success");
      } else {
        Get.snackbar("Post Api", "Logged in Failed");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> uploadImage() async {
    try {
      var stream = new http.ByteStream(image.value!.openRead());
      stream.cast();
      var length = await image.value!.length();
      var uri = Uri.parse('https://fakestoreapi.com/products');

      var request = new http.MultipartRequest('POST', uri);
      request.fields['title'] = "Samiullah";
      var multiPort = new http.MultipartFile('image', stream, length);
      request.files.add(multiPort);
      var responce = await request.send();
      if (responce.statusCode == 200) {
        Get.snackbar('Image Posting', "Image Uploaded Successfully");
      } else {
        Get.snackbar("Image Posting", "Failed");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> uploadData() async {
    try {
      final responce = await http
          .post(Uri.parse('https://fakestoreapi.com/products'), body: {
        "id": '20',
        "title": "DANVOUY Womens T Shirt Casual Cotton Short",
        "price": '12.99',
      });
      if (responce.statusCode == 200) {
        Get.snackbar("Data Posting", "Data uploaded Success");
        print("responce : ${responce.body.toString()}");
      } else {
        Get.snackbar("Data Posting", "Failed");
      }
    } catch (e) {
      print(e);
    }
  }
}
