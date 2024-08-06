import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guliva_clone/presentation/provider/signup_state.dart';
import 'package:guliva_clone/presentation/screens/vehicle_passenger_screen.dart';
import 'package:guliva_clone/presentation/widgets/buttons.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final signUpProvider = Provider.of<SignUpProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title:  Image.asset('assets/images/guliva_header.png'),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
               const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'SIGN UP WITH...',
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
                      height: 20,
                      width: 20,
                    ),
                    color: Colors.white,
                    height: 50,
                    width:  MediaQuery.of(context).size.width * 0.4,
                   ),
                  SizedBox(height: 16),
                  FlexibleButton(
                    label: "FACEBOOK",
                    icon: SvgPicture.asset(
                      'assets/svg_icons/facebook.svg',
                      height: 20,
                      width: 20,
                    ),
                    color: Colors.white,
                    width:  MediaQuery.of(context).size.width * 0.4,
                    height: 50,
                   )
                  ],
                ),
              ),
              SizedBox(height: 32),
              const Text(
                'SIGN UP WITH EMAIL',
                style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 94, 93, 93)),
              ),
              SizedBox(height: 32),
              const Align(
                alignment: Alignment.topLeft,
                child: Text("First Name"),
              ),
              TextField(
                onChanged: (value) => signUpProvider.setFirstName(value),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              const Align(
                alignment: Alignment.topLeft,
                child: Text("Last Name"),
              ),
              TextField(
                onChanged: (value) => signUpProvider.setLastName(value),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              const Align(
                alignment: Alignment.topLeft,
                child: Text("Phone Number"),
              ),
              TextField(
                onChanged: (value) => signUpProvider.setPhoneNumber(value),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              const Align(
                alignment: Alignment.topLeft,
                child: Text("Email"),
              ),
              TextField(
                onChanged: (value) => signUpProvider.setEmail(value),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              const Align(
                alignment: Alignment.topLeft,
                child: Text("Date of Birth"),
              ),
              TextField(
                readOnly: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (pickedDate != null) {
                    signUpProvider.setDateOfBirth(pickedDate);
                  }
                },
              ),
              const SizedBox(height: 16),
              const Align(
                alignment: Alignment.topLeft,
                child: Text("Email"),
              ),
              TextField(
                onChanged: (value) => signUpProvider.setPassword(value),
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.visibility_outlined),
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Checkbox(
                    value: signUpProvider.isAgreeToTerms,
                    onChanged: (value) {
                      signUpProvider.setAgreeToTerms(value!);
                    },
                  ),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        text: 'I agree to the ',
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: 'Terms & Conditions',
                            style: TextStyle(color: Color.fromARGB(255, 216, 67, 13)),
                          ),
                          TextSpan(
                            text: ' and ',
                          ),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(color:Color.fromARGB(255, 216, 67, 13) ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              FlexibleButton(
                color:  const Color.fromARGB(255, 60, 58, 58),
                height: 50,
                onTap: signUpProvider.isLoading || !signUpProvider.isAgreeToTerms
                    ? null
                    : () {
                        signUpProvider.signUp();
                      },
                icon: signUpProvider.isLoading
                    ? CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : Text('SIGN UP', style: TextStyle(color: Colors.white),),
              ),
              SizedBox(height: 16),
              TextButton(
                onPressed: () {
                 Navigator.of(context).pop();
                },
                child: RichText(
                 text: const TextSpan(
                  text: "Already have an account?",
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(text: ' Log In', style: TextStyle(color: Color.fromARGB(255, 216, 67, 13))),
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
