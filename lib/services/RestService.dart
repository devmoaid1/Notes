import 'dart:convert';
import 'package:http/http.dart' as http;

class RestService {
  RestService();
  String url = "https://jsonplaceholder.typicode.com/";

  Uri baseUrl(String endPoint) => Uri.parse("$url$endPoint");

  Future get(String endpoint) async {
    final response = await http.get(baseUrl(endpoint));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw response.statusCode;
    }
  }

  Future post(String endpoint, {dynamic data}) async {
    final response = await http.post(baseUrl(endpoint),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(data));

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    }

    throw jsonDecode(response.statusCode.toString());
  }

  Future patch(String endpoint, {dynamic data}) async {
    final response = await http.patch(baseUrl(endpoint),
        headers: {'Content-Type': 'application/json'}, body: jsonEncode(data));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw response;
  }

  Future delete(String endpoint) async {
    final response = await http.delete(baseUrl(endpoint));

    if (response.statusCode == 200) {
      return;
    }
    throw response;
  }
}
