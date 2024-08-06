import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guliva_clone/presentation/provider/login_state.dart';
import 'package:guliva_clone/presentation/screens/signup_screen.dart';
import 'package:guliva_clone/presentation/widgets/buttons.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title:  Image.asset('assets/images/guliva_header.png'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Log In',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'LOG IN WITH...',
                style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 94, 93, 93)),
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   FlexibleButton(
                    label: "GOOGLE",
                    icon: SvgPicture.asset(
                      'assets/svg_icons/google.svg',
                      width: 20,
                      height: 20,
                      color:  Colors.black,
                    ),
                    color: Colors.white,
                    height: 50,
                    width:  MediaQuery.of(context).size.width * 0.4,
                   ),
                  
                  FlexibleButton(
                    label: "FACEBOOK",
                    icon: SvgPicture.asset(
                      'assets/svg_icons/facebook.svg',
                      width: 20, 
                      height: 20,
                    ),
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 50,
                   )
                  ],
                ),
              ),
              const SizedBox(height: 32,),
              const Text(
                'LOG IN WITH EMAIL',
                style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 94, 93, 93)),
              ),
              SizedBox(height: 32),
              const Align(
                alignment: Alignment.topLeft,
                child: Text("Email address"),
              ),
              SizedBox(height: 4),
              TextField(
                onChanged: (value) => loginProvider.setEmail(value),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const Align(
                alignment: Alignment.topLeft,
                child: Text("Password"),
              ),
              const SizedBox(height: 4),
              TextField(
                onChanged: (value) => loginProvider.setPassword(value),
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.visibility_outlined),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(color: Color.fromARGB(255, 216, 67, 13),)
                  ),
                ),
              ),
              SizedBox(height: 16),
              FlexibleButton(
                textColor: Colors.white,
                height: 50,
                color: Color.fromARGB(255, 5, 30, 73),
                onTap: loginProvider.isLoading
                    ? null
                    : () {
                        loginProvider.login();
                      },
                icon: loginProvider.isLoading
                    ? CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : const Text(
                      'LOG IN',
                      style: TextStyle(color: Colors.white) 
                    ),
              ),
              SizedBox(height: 16),
              Icon(
                Icons.fingerprint,
                size: 75,
              ),
              const Text(
                'Touch / Face ID',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)
              ),
              SizedBox(height: 32),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpScreen(),
                  ),
                );
                },
                child: RichText(
                 text: const TextSpan(
                  text: "Don't have an account?",
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(text: ' Sign Up', style: TextStyle(color: Color.fromARGB(255, 216, 67, 13))),
                  ]
                 )
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
