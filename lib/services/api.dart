// ignore_for_file: prefer_function_declarations_over_variables
import 'dart:convert';

import 'package:http/http.dart' as http;

// not ideal
final api = Api();

class ApiException implements Exception {
  ApiException(this.statusCode, this.message);

  final int statusCode;
  final String message;

  @override
  String toString() => '[ApiException $statusCode]: $message';
}

class Api {
  final String baseUrl;

  String? _accessToken;

  Api({this.baseUrl = "192.168.3.16:8000"});

  bool get isLogged => _accessToken != null;

  Future<dynamic> get(String path, [Map<String, dynamic>? params]) {
    print('GET: $path');

    var request = () async => http.get(
          _buildUrl(baseUrl, path, params),
          headers: _buildHeaders(),
        );

    return _makeRequest(request);
  }

  Future<dynamic> post(String path, dynamic body,
      [Map<String, String>? headers]) {
    print('POST: $path');

    var request = () async => http.post(
          _buildUrl(baseUrl, path),
          body: json.encode(body),
          headers: headers ?? _buildHeaders(),
        );

    return _makeRequest(request);
  }

  Future<void> put(String path, dynamic body) {
    print('PUT: $path');

    var request = () async => http.put(
          _buildUrl(baseUrl, path),
          headers: _buildHeaders(),
          body: json.encode(body),
        );

    return _makeRequest(request);
  }

  Future<void> delete(String path) {
    print('DELETE: $path');

    var request = () async => http.delete(
          _buildUrl(baseUrl, path),
          headers: _buildHeaders(),
        );

    return _makeRequest(request);
  }

  Future<void> login(String name, String password) async {
    Map<String, dynamic> response = await post(
      '/auth/login',
      {
        'name': name,
        'password': password,
      },
    );

    _accessToken = response['access_token'];

    print(_accessToken);
  }

  Future<void> logout() async {
    _accessToken = null;
  }

  Uri _buildUrl(String authority, String unencodedPath,
      [Map<String, dynamic>? queryParameters]) {
    return Uri.http(authority, unencodedPath, queryParameters);
  }

  Map<String, String> _buildHeaders() => {
        'Authorization': 'Bearer $_accessToken',
        'Content-Type': 'application/json; charset=UTF-8'
      };

  dynamic _makeRequest(Future<http.Response> Function() request) async {
    http.Response response;
    try {
      response = await request();
    } catch (e) {
      print(e);
      throw ApiException(0, "Algo deu errado :(");
    }

    print(response.statusCode);

    // error handler
    if (response.statusCode >= 400) {
      print(response.statusCode);

      Map decodedBody = json.decode(response.body);
      var message = decodedBody['message'];

      if (message is List) {
        throw ApiException(response.statusCode, message.first);
      }

      if (message is String) throw ApiException(response.statusCode, message);
    }

    // parse body
    if (response.body.isNotEmpty) return json.decode(response.body);
  }
}
