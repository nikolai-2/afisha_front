import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';

import 'package:http/http.dart' as http;

const String url = 'https://oggetto.mtdl.ru';
final String accessToken = dotenv.env['accessToken']!;

Future<Response> getDataFromAPI(String pen, String data) async {
  final _response = await http
      .get(Uri.parse('$url$pen$data'), headers: {"accessToken": accessToken});
  return _response;
}

Future<Response> postDataFromAPI(String pen, Map data) async {
  final _response = await http.post(Uri.parse('$url$pen'),
      body: Map, headers: {"accessToken": accessToken});
  return _response;
}
