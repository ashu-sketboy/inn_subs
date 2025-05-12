import 'package:flutter/material.dart';
import 'package:inn_subs/core/helper/isar_service/isar_service.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  IsarService.init();
  runApp(const App());
}
