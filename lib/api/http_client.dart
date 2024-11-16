import 'dart:convert';

import 'package:e_commerce_app/api/api.dart';
import 'package:http/http.dart';

import '../common/utils.dart';
import '../preferenceManager/preference_manager.dart';

class HttpClient {
  const HttpClient._();
  static final _client = Client();

  static Future<Response> getRequest(String url) async {
    final token = await PreferenceManager.getUserToken();
    final response = await _client.get(Uri.parse(url), headers: {
      ...customHeader(token: token),
    }).timeout(timeLimit);
    logger.d(token);
    logger.d(response.body.toString());

    return response;
  }

  static Future<Response> postRequest(String url,
      {Object? body, Map<String, String>? headers}) async {
    final token = await PreferenceManager.getUserToken();
    final response = await _client
        .post(Uri.parse(url),
            headers: headers ?? customHeader(token: token),
            body: jsonEncode(body))
        .timeout(timeLimit);
    logger.d(response.body.toString());
    logger.d(body.toString());
    logger.d(response.statusCode.toString());
    logger.d(token);
    // handle401Error(response.statusCode);
    return response;
  }

  static Future<Response> deleteRequest(String url, {Object? body}) async {
    final token = await PreferenceManager.getUserToken();
    final response = await _client
        .delete(Uri.parse(url),
            headers: {'Authorization': 'Bearer $token'}, body: body)
        .timeout(timeLimit);
    logger.d(response.body.toString());
    logger.d(response.statusCode.toString());
    // handle401Error(response.statusCode);
    return response;
  }

  static Future<Response> patchRequest(String url, Object body) async {
    final token = await PreferenceManager.getUserToken();
    final response = await _client
        .patch(Uri.parse(url),
            headers: {'Authorization': 'Bearer $token'}, body: body)
        .timeout(timeLimit);
    logger.d(response.statusCode.toString());
    logger.d(response.body.toString());
    // handle401Error(response.statusCode);
    return response;
  }
}
