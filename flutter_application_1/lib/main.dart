import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

String img1 = "image/bloom17.png";
String img2 = "image/bubble-gum-man-plays-guitar.png";
String img3 = "image/pablo-musician.png";
var images = [img1, img2, img3];
int currentImg = 0;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Welcome to Flutter",
        theme: ThemeData(primarySwatch: Colors.blue),
        home: Scaffold(
            appBar: AppBar(
              title: const Text(
                "Welcome to Flutter",
                textDirection: TextDirection.ltr,
              ),
              centerTitle: true,
            ),
            body: Center(
              child: Column(children: [
                const SizedBox(height: 10),
                ElevatedButton(
                    child: const Text("Click me"),
                    onPressed: () {
                      setState(() {
                        currentImg = (currentImg + 1) % images.length;
                      });
                    }),
                Image.asset(images[currentImg])
              ]),
            )));
  }
}
