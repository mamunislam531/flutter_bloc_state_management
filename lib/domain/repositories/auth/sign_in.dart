import 'dart:developer';
import 'package:http/http.dart' as http;

class LoginRepo {
  static Future<bool> loginRepo({required String email, required String password}) async {
    try {
      Uri url = Uri.parse("https://woodmachinery.com.bd/api/v1/dealer/login");
      var body = {'email': email, 'password': password};
      var header = {'Content-Type': 'application/json', 'Accept': 'application/json'};
      var response = await http.post(url, body: body, headers: header);

      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      log("Error : $e");
    }
    return false;
  }
}
