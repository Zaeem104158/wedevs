import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:wedevs/service/env.dart';

class ApiService {
  late String baseUrl;
  ApiService({Environment environment = Environment.test}) {
    switch (environment) {
      case Environment.production:
        baseUrl = productionUrl;
        break;
      case Environment.test:
        baseUrl = testingUrl;
        break;
    }
  }

  Map<String, String> headerChecker(HeaderType headerType) {
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

    final response = await http.post(
      url,
      headers: headers,
      body: headerType == HeaderType.json ? jsonEncode(data) : data,
    );
 
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return jsonDecode(response.body);
    }
  }
}
