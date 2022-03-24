import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_stay/login/login.dart';
import 'package:home_stay/main.dart';
import '../main.dart';
import '../pages/profile.dart';

class signUp extends StatefulWidget {
  const signUp({Key? key}) : super(key: key);

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernamController = TextEditingController();
  final repasswordController = TextEditingController();
  bool isPasswordVisible = false;
  bool isPasswordVisible1 = false;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernamController.dispose();
    repasswordController.dispose();
    super.dispose();
  }

  void showAlertDialog(BuildContext context) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
            title: Text(
              'Password doesn\'t match',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            content: Text(
              "The re-entered password doesn\'t match with the password",
              style: Theme.of(context).textTheme.bodyText2,
            ),
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.pop(
                    context,
                    MaterialPageRoute(
                      builder: (context) => signUp(),
                    ),
                  );
                },
                child: Text('Try Again !',
                    style: Theme.of(context).textTheme.bodyText2),
              ),
            ]),
      );

  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            MediaQuery.of(context).size.width * 0.08,
            MediaQuery.of(context).size.height * 0.1,
            MediaQuery.of(context).size.width * 0.08,
            MediaQuery.of(context).size.height * 0.05,
          ),
          child: ListView(
            children: [
              // -------------->container for app logo in log in page<-------------//

              Container(
                margin: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.05,
                    (MediaQuery.of(context).size.height -
                            AppBar().preferredSize.height) *
                        0.02,
                    MediaQuery.of(context).size.width * 0.05,
                    0),
                padding: EdgeInsets.all(10),
                height: (MediaQuery.of(context).size.height -
                        AppBar().preferredSize.height) *
                    0.2,
                width: MediaQuery.of(context).size.width * 0.3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/icon.png'),
                    // fit: BoxFit.fill,
                  ),
                ),
              ),

              // ------------->container for email<-------------------------//

              Container(
                margin: EdgeInsets.fromLTRB(
                    0, MediaQuery.of(context).size.height * 0.015, 0, 0),
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor),
                    ),
                    prefixIcon: Icon(Icons.mail),
                    labelText: 'Email',
                    // hintText: 'username123@gmail.com',
                    hintStyle: GoogleFonts.lato(
                      color: Theme.of(context).primaryColor,
                    ),
                    isDense: true,
                    contentPadding: EdgeInsets.all(10),
                  ),
                  style: GoogleFonts.lato(
                    color: Theme.of(context).primaryColor,
                  ),
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              // ---------------------->username<--------------------------------//
              Container(
                margin: EdgeInsets.fromLTRB(
                    0, MediaQuery.of(context).size.height * 0.015, 0, 0),
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: usernamController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor),
                    ),
                    prefixIcon: Icon(Icons.person),
                    labelText: 'username',
                    // hintText: 'username123@gmail.com',
                    hintStyle: GoogleFonts.lato(
                      color: Theme.of(context).primaryColor,
                    ),
                    isDense: true,
                    contentPadding: EdgeInsets.all(10),
                  ),
                  style: GoogleFonts.lato(
                    color: Theme.of(context).primaryColor,
                  ),
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                ),
              ),

              // ----------->container for the password<---------------//

              Container(
                padding: const EdgeInsets.all(10),
                margin: EdgeInsets.fromLTRB(
                    0, MediaQuery.of(context).size.height * 0.015, 0, 0),
                child: TextField(
                  controller: passwordController,
                  obscureText: !isPasswordVisible,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor),
                    ),
                    prefixIcon: Icon(Icons.key),
                    suffixIcon: IconButton(
                      icon: isPasswordVisible
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility),
                      onPressed: () {
                        setState(() => isPasswordVisible = !isPasswordVisible);
                      },
                    ),
                    labelText: 'Password',
                    hintStyle: GoogleFonts.lato(
                      color: Theme.of(context).primaryColor,
                    ),
                    isDense: true,
                    contentPadding: EdgeInsets.all(10),
                  ),
                  style: GoogleFonts.lato(
                    color: Theme.of(context).primaryColor,
                  ),
                  textInputAction: TextInputAction.done,
                ),
              ),

              // -------------------> retype password<------------------------//

              Container(
                padding: const EdgeInsets.all(10),
                margin: EdgeInsets.fromLTRB(
                    0, MediaQuery.of(context).size.height * 0.015, 0, 0),
                child: TextField(
                  controller: repasswordController,
                  obscureText: !isPasswordVisible1,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor),
                    ),
                    prefixIcon: Icon(Icons.key),
                    suffixIcon: IconButton(
                      icon: isPasswordVisible1
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility),
                      onPressed: () {
                        setState(
                            () => isPasswordVisible1 = !isPasswordVisible1);
                      },
                    ),
                    labelText: 'ReType-Password',
                    hintStyle: GoogleFonts.lato(
                      color: Theme.of(context).primaryColor,
                    ),
                    isDense: true,
                    contentPadding: EdgeInsets.all(10),
                  ),
                  style: GoogleFonts.lato(
                    color: Theme.of(context).primaryColor,
                  ),
                  textInputAction: TextInputAction.done,
                ),
              ),

              // ---------------->Sign up button<------------------------------------//

              Container(
                height: MediaQuery.of(context).size.height * 0.06,
                margin: EdgeInsets.fromLTRB(
                    0, MediaQuery.of(context).size.height * 0.015, 0, 0),
                padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.2,
                    0,
                    MediaQuery.of(context).size.width * 0.2,
                    0),
                child: ElevatedButton(
                  child: Text(
                    'SignUp',
                    style: GoogleFonts.lato(),
                  ),
                  onPressed: () {
                    passwordController.text == repasswordController.text
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyHomePage(),
                            ),
                          )
                        : showAlertDialog(context);
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
              ),

              // ----------------->sign up way<-----------------------------//

              Container(
                margin: EdgeInsets.fromLTRB(
                    0, MediaQuery.of(context).size.height * 0.015, 0, 0),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Already have an account?',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    TextButton(
                      child: Text(
                        'Log In',
                        style: GoogleFonts.lato(
                          color: Color(0xff533e85),
                          decoration: TextDecoration.underline,
                          fontSize: 20,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => logIn(),
                          ),
                        );
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
