import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:responsive_admin_dashboard/constants/responsive.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  // login function
  static Future<User?> loginUsingEmailPassword({required String email, required String password, required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User?user;
    try{
      UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
      user = userCredential.user;
    }on FirebaseAuthException catch(e){
      if(e.code == 'user-not-found'){
        print('No User found for that email');
      }
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    // create the textfilled controller
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Login Screen'),
          ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.teal,
                  fontWeight: FontWeight.bold
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Form(
                  child: Column(
                    children: [

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: 'User',
                            hintText: 'Enter User Name',
                            prefixIcon: Icon(Icons.person),
                            // border: OutlineInputBorder(),
                          ),

                          onChanged: (String value) {

                          },
                          validator: (value) {
                            return value!.isEmpty ? 'Please Enter Email' : null;
                          },
                        ),
                      ),

                      const SizedBox(height: 30,),
                      
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: TextFormField(
                          controller: _passwordController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            hintText: 'Enter Password',
                            prefixIcon: Icon(Icons.lock),
                            // border: OutlineInputBorder(),
                          ),
                          onChanged: (String value) {

                          },
                          validator: (value) {
                            return value!.isEmpty ? 'Please Enter Password' : null;
                          },
                        ),
                      ),

                      const SizedBox(height: 30,),

                      Padding(
                        
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          onPressed: () async{
                            User? user = await loginUsingEmailPassword(email: _emailController.text, password: _passwordController.text, context: context);
                            if(user != null) {
                              Navigator.pushNamed(context, Responsive.dashBoardScreen);
                             }
                            },
                          color: Colors.teal,
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                          child: const Text('Login'),
                          ),
                      )
                    ],
                  ),
                ),
              )
            ]),
      ),
    );
  }
}


