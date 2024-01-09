import 'package:flutter/material.dart';

import 'app/app.dart';
import 'core/resources/service_locator.dart';

void main(){
  setupServiceLocator();
  runApp(const BooklyApp());

}
