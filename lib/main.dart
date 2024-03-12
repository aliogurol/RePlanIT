import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/constants/responsive.dart';
import 'package:responsive_admin_dashboard/screens/route_generator.dart';
import 'firebase_options.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // Initialize Firebase App
   _initializeFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    FirebaseApp firebaseApp = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ).whenComplete(() => print('Init FireBase'));
    return firebaseApp;
  }
  @override
  Widget build(BuildContext context) {
    return 
      FutureBuilder(
        future: _initializeFirebase(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            // ignore: prefer_const_constructors
            return MaterialApp(
              onGenerateRoute: MyRoutes.generateRotes,
              initialRoute: Responsive.serversMain,
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      );
  }
}