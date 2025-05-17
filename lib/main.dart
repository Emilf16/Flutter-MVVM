import 'package:flutter/material.dart';
import 'package:mvvm_with_provider/user_list/views/home_screen.dart';
import 'package:mvvm_with_provider/user_list/view_models/users_view_model.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UsersViewModel())],
      child: MaterialApp(
          title: 'MVVM',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primarySwatch: Colors.blue,
              brightness: Brightness.light,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.blue,
                iconTheme: IconThemeData(color: Colors.white),
                actionsIconTheme: IconThemeData(color: Colors.white),
              ),
              iconTheme: const IconThemeData(color: Colors.blue)),
          home: HomeScreen()),
    );
  }
}
