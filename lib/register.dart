import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var a=true;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/login.png"), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 35, top: 135),
              child: const Text(
                'Register \n Page',
                style: TextStyle(
                  color: Colors.white,
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
                  TextField(
                    decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.verified_user_outlined),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        hintText: "Username",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.email),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        hintText: "Email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                      obscureText: a,
                      decoration: InputDecoration(
                          
                          suffixIcon: IconButton(
                            onPressed: () {
                              if(a==true){
                                setState(() {
                                  a=false;
                                }
                                
                                );
                              }
                              else{
                                  setState(() {
                                    a=true;
                                  });
                                }
                            },
                            icon:a==true? const Icon(Icons.visibility):const Icon(Icons.visibility_off),
                          ),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          hintText: "password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)))),
                  Row(
                    children: [
                      const Text("Already a User"),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "login");
                        },
                        child: const Text(
                          "login",
                          style: TextStyle(color: Colors.blue),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Signin"),
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
