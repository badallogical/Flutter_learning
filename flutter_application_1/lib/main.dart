import "package:flutter/material.dart";
import "package:flutter_application_1/pages/login.dart";

void main() {
  runApp(const MyApp());
}

String img1 = "image/bloom17.png";
String img2 = "image/bubble-gum-man-plays-guitar.png";
String img3 = "image/pablo-musician.png";
var images = [img1, img2, img3];
int currentImg = 0;
int counter = 0;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Welcome to Flutter",
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const MyHome());
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHome();
}

class _MyHome extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Welcome to Flutter",
            textDirection: TextDirection.ltr,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(children: [
              const SizedBox(height: 10),
              ElevatedButton(
                  child: const Text("Change me"),
                  onPressed: () {
                    setState(() {
                      currentImg = (currentImg + 1) % images.length;
                    });
                  }),
              Image.asset(images[currentImg]),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      counter++;
                      if (counter > images.length) {
                        counter = counter - 1;
                      }
                    });
                  },
                  child: const Text("Add")),
              Column(
                  children: List.generate(counter, (index) {
                return Image.asset(images[index]);
              })),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      onPressed: () {},
                      child: const Text("Register")),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                        );
                      },
                      child: const Text("Login"))
                ],
              ),
              const SizedBox(
                height: 30,
              )
            ]),
          ),
        ));
  }
}
