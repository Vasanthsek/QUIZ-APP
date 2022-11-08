import 'package:flutter/material.dart';
import 'package:quiz_app_final/my_quiz.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Creativity Quiz"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          
          Center(child: Image.asset("images/ideas.png")),
          const SizedBox(height: 10.0,),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const MyQuiz()),);
            },
            child: const Text("Take Quiz"),
          ),
          const Spacer(),
        ],
      ),
    );
  }

}
