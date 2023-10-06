import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

String img1 = "image/bloom17.png";
String img2 = "image/bubble-gum-man-plays-guitar.png";
String img3 = "image/pablo-musician.png";
var images = [img1, img2, img3];
int currentImg = 0;
int counter = 0;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void _showPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Popup Message'),
          content: const Text('This is a pop-up message.'),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

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
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red),
                          onPressed: () {},
                          child: const Text("Register")),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green),
                          onPressed: () {},
                          child: const Text("Login"))
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  )
                ]),
              ),
            )));
  }
}
