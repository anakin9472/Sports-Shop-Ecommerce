import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:primas_sport/src/data/models/account.dart';
// import 'package:sports_shop_project/models/product.dart';

import '../models/models.dart';

class AccountsService {
  Future<String>? addAccount(Map data) async {
    var client = http.Client();
    String body = json.encode(data);
    var uri = Uri.parse('https://192.168.0.9:7070/api/Accounts');
    try {
      var response = await http.post(
        uri,
        body: body,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Access-Control-Allow-Origin": "*"
        },
      );
      if (response.statusCode == 200) {
        return " successfully";
      }
      if (response.body != null) {
        return " successfully";
      }
    } catch (error) {
      throw error;
    }
    return "error";
  }
}
