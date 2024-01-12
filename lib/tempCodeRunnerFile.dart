import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tanara/provider/auth_provider.dart';
import 'package:tanara/provider/tanaman_provider.dart';
import 'package:tanara/routes/app_routes.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider<TanamanProvider>(
          create: (context) => TanamanProvider(),
        ),
        // tambahkan provider lain jika diperlukan
      ],
      child: MyApp(),
    ),
  );
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.root,
    );
  }
}
