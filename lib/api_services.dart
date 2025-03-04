import 'dart:convert';

import 'package:api_integration/data_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<DataModel?> getDataWithModel() async {
    try {
      var response = await http.get(Uri.parse("https://reqres.in/api/unknown"));
      if (response.statusCode == 200) {
        DataModel model = DataModel.fromJson(json.decode(response.body));
        return model;
      }
    } catch (e) {
      print(e);
    }

    return null;
  }

  Future<List<DataModel>?> getListDataWithModel() async {
    try {
      var response = await http.get(Uri.parse("https://reqres.in/api/unknown"));
      if (response.statusCode == 200) {
        List<DataModel> model = List<DataModel>.from(
            json.decode(response.body).map((x) => DataModel.fromJson(x)));
        return model;
      }
    } catch (e) {
      print(e);
    }

    return null;
  }
}
