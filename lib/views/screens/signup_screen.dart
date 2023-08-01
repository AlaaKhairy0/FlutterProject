import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_new/views/widgets/main_button.dart';
import 'package:regexpattern/regexpattern.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Form(
          key:_formKey ,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column (
                children: [
                  const Text("Sign Up",style:
                  TextStyle(color: Colors.black,fontSize: 30 ,fontWeight: FontWeight.bold),),
                  const SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    controller: usernameController,
                    decoration: const InputDecoration(labelText: 'Username'),
                    validator: (value) {
                      bool isMatch = value!.isUsername();
                      if ( isMatch ){
                        return null;
                      }
                      else{
                        return 'please enter correct username';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator: (value){
                      bool isMatch = value!.isEmail();
                      if ( isMatch ){
                        return null;
                      }
                      else{
                        return 'please enter correct email';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(labelText: 'Password'),
                    validator: (value){
                      bool isMatch = value!.isPasswordEasy() ;
                      if ( isMatch ){
                        return null;
                      }
                      else{
                        return 'please enter correct password';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Confirm Password'),
                    validator: (value){
                      if (value == passwordController.text){
                        return null;
                      }
                      else{
                        return 'not matched';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  MainButton(
                    label: "Sign Up",onTap: () async {

                    if (_formKey.currentState!.validate()) {
                      firebaseSignUp(emailController.text, passwordController.text);
                      // final SharedPreferences prefs = await SharedPreferences.getInstance();
                      // await prefs.setString('username', usernameController.text);
                      Navigator.pushNamed(context, '/');
                    }
                    else{
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Signed Up Failed')));
                    }
                  },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have account?",style: TextStyle(fontSize: 16),),
                      const SizedBox(
                        width: 15,
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, '/');
                        },
                          child:
                          const Text('Sign In',style: TextStyle(
                              color: Colors.purple,fontSize:18,fontWeight: FontWeight.bold ),))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Future<bool> firebaseSignUp(String email , String password) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user != null){
        return true;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    return false;
  }
}
