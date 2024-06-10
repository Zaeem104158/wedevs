import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:wedevs/const/const_methods.dart';

class ApiService {
  late String baseUrl;
  ApiService({Environment environment = Environment.test}) {
    switch (environment) {
      case Environment.production:
        baseUrl = 'https://api.production.com';
        break;
      case Environment.test:
        baseUrl = 'https://apptest.dokandemo.com/wp-json';
        break;
    }
  }

  Map<String, String> headerChecker(HeaderType headerType) {
    // Map<String, String> headers = {};

    switch (headerType) {
      case HeaderType.json:
        return {'Content-Type': 'application/json'};

      case HeaderType.xwwwurlencoded:
        return {'Content-Type': 'application/x-www-form-urlencoded'};

      case HeaderType.formdata:
        return {'Content-Type': 'application/json'};

      default:
        return {'Content-Type': 'application/json'};
    }
  }

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
      HeaderType headerType, String endpoint, Map<String, dynamic> data) async {
    final url = Uri.parse('$baseUrl$endpoint');
    Map<String, String> headers = headerChecker(headerType);
    log("$url , $headers, $data");
    try {
      final response = await http.post(
        url,
        headers: headers,
        body: data,
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
