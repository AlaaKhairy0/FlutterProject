import 'package:flutter/material.dart';
import 'package:flutter_new/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String email = "";
  //int phone =0;

  Future<void> getCachedEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
   // if ( prefs.getString('email')!.startsWith(RegExp(r'[a-zA-Z]')) ) {
      email = prefs.getString('email') ?? '--';
    //}
   // else {
      //phone = prefs.getInt('email') ?? 0;
   // };
    setState(() {});
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCachedEmail();
  }
  @override
  Widget build(BuildContext context) {
   // User user= ModalRoute.of(context)!.settings.arguments as User;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){
          Navigator.pop(context);
        },),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:
          [
            Center(child: Text("Welcome")),

            Center(child: Text((email))),
            //Center(child: Text((phone as String))),




    //         if (email . startsWith(RegExp(r'[a-zA-Z]')){
    //           Center(child: Text(email));
    //         }
    //         else {
    //           Center(child: Text(phone as String));
    //
    // }

          ],
        ),
    );
  }
}
