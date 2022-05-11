import 'package:flutter/material.dart';
import 'package:notify/providers/user_provider.dart';
import 'package:notify/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => UserProvider()),
  ], child: HomeScreen()));
}
