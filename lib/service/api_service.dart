import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class ApiService {
  String? baseUrl = "";

  ApiService({this.baseUrl = "https://apptest.dokandemo.com/wp-json"});

  // GET request
  Future<dynamic> get(String endpoint) async {
    final url = Uri.parse('$baseUrl$endpoint');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }

  // POST request
  Future<Map<String, dynamic>> post(
      String endpoint, Map<String, dynamic> data) async {
        
    final url = Uri.parse('$baseUrl$endpoint');
    // /wp/v2/users/register
    log("$url");
    try {
      final response = await http.post(
        url,
        headers: {
        //'Content-Type': 'application/json',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        encoding: Encoding.getByName('utf-8'),
        body: data/*jsonEncode(data)*/,
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to post data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
