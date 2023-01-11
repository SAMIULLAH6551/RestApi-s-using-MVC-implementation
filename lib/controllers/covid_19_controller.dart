import 'dart:convert';

import 'package:all_rest_apis/models/world_states_model.dart';
import 'package:all_rest_apis/services/utils/app_url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Covid19Controller extends GetxController {
  Future<WorldStateModel> worldData() async {
    var responce = await http.get(Uri.parse(AppUrl.worldStatesApi));
    if (responce.statusCode == 200) {
      print("Success World Data");
      var data = jsonDecode(responce.body.toString());
      return WorldStateModel.fromJson(data);
    } else {
      throw Exception("Error");
    }
  }

  Future<List<dynamic>> countriesData() async {
    var data;
    final response = await http.get(Uri.parse(AppUrl.countriesList));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Error');
    }
  }
}
