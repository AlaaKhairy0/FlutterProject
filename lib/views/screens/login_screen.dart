import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_new/views/screens/home_screen.dart';
import 'package:flutter_new/views/widgets/main_button.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: 
      SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                height: 180.0,
                width: 180.0,
                child: Image(image: AssetImage("assets/img.png")
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextFormField(
                  controller: emailController  ,
                  decoration: InputDecoration(labelText: "Phone Number or Email"),
                  validator: (value) {
                    if (value!.isNotEmpty && value!.startsWith(RegExp(r'[0-9]')) && value!.length==11 ) {
                      return null;
                    }
                    else if (value!.isNotEmpty && value!.startsWith(RegExp(r'[a-zA-Z]')) && value!.contains('@')){
                      return null;
                    }
                    return 'Please enter valid mail or phone';
                  },
                ),
              ),
              Padding(padding: EdgeInsets.all(15) , child:
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(labelText: "Password"),
                  validator: (value) {
                    if (value!.length <8 ) {
                      return 'Please enter valid password';}
                    return null;
                  },
              ),
              ),
              SizedBox(
                height: 30,
              ),
              MainButton(label: "Log In",onTap: () async {
                if (_formKey.currentState!.validate()) {
                 bool result =await firebaseLogin(emailController.text, passwordController.text);
                  if(result){
                    final SharedPreferences prefs = await SharedPreferences.getInstance();
                    await prefs.setString('email', emailController.text);
                    Navigator.pushNamed(
                      context,'/home',
                    );
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Login Failed')),
                    );
                  };
                }

              },),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Forgot password?",),
                  SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap:() {},
                    child: Text("Tap me",style: TextStyle(color: Colors.purple,fontWeight: FontWeight.bold,),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
          MainButton(label: "No Account? Sign Up",onTap: (){},buttonColor: Colors.grey,),

            ],
          ),
        ),
      ),
      
    );
  }

 Future<bool> firebaseLogin(String email , String password) async {
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
    );
    if(credential.user != null){
      return true;
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
  return false;
}
}
