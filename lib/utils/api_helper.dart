import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jenil_chandarana_demo2/screens/home/modal/home_modal.dart';


class ApiHelper
{
  static ApiHelper apiHelper = ApiHelper._();
  ApiHelper._();


  Future<ProductModal> getApi()
  async {
    String link = "https://praticle-service.s3.ap-south-1.amazonaws.com/red_and_white_api.json";
    Uri uri = Uri.parse(link);
    var res = await http.get(uri);
    var json = jsonDecode(res.body);
    ProductModal data = ProductModal.fromJson(json);
    return data;
  }
}