import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimationDemo(),
    ),
  );
}

class AnimationDemo extends StatefulWidget {
  const AnimationDemo({super.key});

  @override
  State<AnimationDemo> createState() => _AnimationDemoState();
}

class _AnimationDemoState extends State<AnimationDemo> {
  bool isExpanded = false;
  bool showText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Animation'),
        backgroundColor: Colors.amberAccent,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              height: isExpanded ? 200 : 150,
              width: isExpanded ? 200 : 150,
              decoration: BoxDecoration(
                  color: isExpanded ? Colors.blueGrey : Colors.pinkAccent,
                  borderRadius: BorderRadius.circular(isExpanded ? 30 : 0)),
            ),
            ElevatedButton(onPressed: (){
              setState(() {
                isExpanded=!isExpanded;
              });
            }, child: const Text('Animated Container')),

            const SizedBox(
              height: 30,
            ),
            AnimatedOpacity(
              opacity: showText?1:0,
             duration:const Duration(seconds:1),
             child: const Text('Hello flutter ',style: TextStyle(fontSize: 24),),
             ),
             const SizedBox(
              height: 30,
             ),
              ElevatedButton(onPressed: (){
                setState(() {
                  showText=!showText;
                });
              }, child: const Text("text visiblity"))
          ],
        ),
      ),
    );
  }
}
