import 'package:flutter/material.dart';
import 'package:hungryapp/core/utils/service_locator.dart';
import 'package:hungryapp/hungry_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  runApp(const HungryApp());
}
