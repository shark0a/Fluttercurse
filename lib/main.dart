import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
       
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.only(top: 150),
                child: SizedBox(
                  height: 100, 
                  child: Image.asset("assets/image/OIP.jpeg"),
                ),
              ), 
                 
                    const Padding(
                      padding: EdgeInsets.only(top: 50,bottom: 25),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'username',
                        ),
                      ),
                    ),
                    
                    const TextField(
                      decoration: InputDecoration(
                        hintText: 'password'
                      ),
                    ),
Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                      child: ElevatedButton(onPressed:(){}, 
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        fixedSize: const Size(double.maxFinite,30),
                      ),child:  const Text('lOGN', style: TextStyle(color: Colors.black),),),
                    ), 

              const Text('Forgot Password? No yawa. Tap me',),
            const SizedBox(height: 50),
              Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical:20 ),
                      child: ElevatedButton(onPressed:(){}, 
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        fixedSize: const Size(double.maxFinite,30),
                      ),child:  const Text('No Account ? Sign Up', style: TextStyle(color: Colors.black),),),
                    ), 
              
            ],

          ),
        ),
      ),
    );
  }
}
