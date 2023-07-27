import 'package:flutter/material.dart';
import 'package:flutter_new/home_screen.dart';
import 'package:flutter_new/widgets/main_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

// class User{
//   var email;
//   User({required this.email});
// }
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

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
              Padding(padding:EdgeInsets.all(15) , child:
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: "Phone Number or Email"),
                validator: (value) {
                  if (value!.isNotEmpty && value!.startsWith(RegExp(r'[0-9]')) && value!.length==11 ) {
                    return null;
                  }
                  else if (value!.isNotEmpty && value!.startsWith(RegExp(r'[a-zA-Z]')) && value!.contains('@')){
                    return null;
                  }
                  return 'Please enter valid mail or phone';
                },),
              ),
              Padding(padding: EdgeInsets.all(15) , child:
              TextFormField(
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
                  final SharedPreferences prefs = await SharedPreferences.getInstance();
                  //if ( emailController.text.startsWith(RegExp(r'[a-zA-Z]')) ) {
                    await prefs.setString('email', emailController.text);
                  // }
                  // else {
                  //   await prefs.setInt('phone', emailController.text as int);
                  // };
                  Navigator.pushNamed(
                    context,'/home',
                      //arguments: User(email: emailController.text)
                  );
                }
                else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Try Again')),
                  );
                };
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


}