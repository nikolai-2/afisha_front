import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:oggetto_afisha_front/internal/application.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const Application());
}
