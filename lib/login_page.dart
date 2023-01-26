import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var a = true;
  var email = "";
  var pass = "";
  bool loading=false;
   final _formKey = GlobalKey<FormState>();

  void login() async {
    try{
      setState(() {
        loading=true;
      });
   await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: pass).then((value) =>Navigator.pushNamed(context, "home"));
        setState(() {
          loading=false;
        });
    }on FirebaseAuthException catch(e){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message.toString()),backgroundColor: Colors.red,));
           setState(() {
          loading=false;
        });
    }
    catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/Login.jpg"), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Form(
          key: _formKey,
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 35, top: 135),
                child: const Text(
                  'Welcome \n Back',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 35,
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.45,
                      right: 35,
                      left: 35),
                  child: Column(children: [
                    TextFormField(
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                      decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.email),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          hintText: "Email",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      obscureText: a,
                      onChanged: (value) {
                        setState(() {
                          pass = value;
                        });
                      },
                      
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            if (a == true) {
                              setState(() {
                                a = false;
                              });
                            } else {
                              setState(() {
                                a = true;
                              });
                            }
                          },
                          icon: a == true
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        hintText: "password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                       validator: (value) {
                        if (value == null || value.length<6) {
                          return 'password shouls contain atleast 6 characteers';
                        }
                        return null;
                      },
                    ),
                    Row(
                      children: [
                        const Text("new here"),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'register');
                          },
                          child: const Text(
                            "Signup",
                            style: TextStyle(color: Colors.blue),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                     loading? const CircularProgressIndicator():
                    Container(
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigator.pushNamed(context, "home");
                          // login();
                          if (_formKey.currentState!.validate()) {
                               login();
                          }else{
                            print("not");
                        }
                        },
                        child: const Text("Login"),
                      ),
                    ),
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
