import 'dart:developer';
import 'dart:io';

import 'package:buttons/profile_screen.dart';
import 'package:buttons/widgets/animated_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
            style: TextButton.styleFrom(
              fixedSize: const Size(100, 30),
              foregroundColor: Colors.white,
              backgroundColor: Colors.black54,
            ),
            onPressed: () {
              navigateToProfile(context);
              log("Text button pressed.");
            },
            child: const FittedBox(
              child: Text("Text Button"),
            ),
          ),
          // inkwell bilan button
          MouseRegion(
            onEnter: (_) => log('Mouse entered'),
            onExit: (_) => log('Mouse exited'),
            child: InkWell(
              onHover: (isHovered) {
                setState(() {
                  _isHovered = !_isHovered;
                });
                log(isHovered.toString());
              },
              onTap: () {
                log("Happy New Year");
              },
              child: SizedBox(
                width: 100,
                child: CircleAvatar(
                    minRadius: _isHovered ? 45 : 50,
                    foregroundImage: NetworkImage(
                        scale: 1,
                        "https://thumbs.dreamstime.com/b/happy-new-year-reflection-fireworks-happy-new-year-fire-works-reflection-sky-314395685.jpg")),
              ),
            ),
          ),
          // ink widgeti bilan style
          const SizedBox(
            height: 30,
          ),
          Ink(
            width: 100,
            height: 100,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.black,
              ),
            ),
            child: InkWell(
              onTap: () {
                log("Ontapppp tapp");
              },
              onLongPress: () {
                log("Second tapp");
              },
              child: const Icon(
                Icons.alarm,
              ),
            ),
          ),
          // gesture detector

          GestureDetector(
            onDoubleTap: () {
              log('Ikki marta bosildi');
            },
            onLongPress: () {
              log('Uzoq bosildi');
            },
            onTap: () => navigateToProfile(context),
            child: Container(
              margin: const EdgeInsets.only(top: 20, left: 15, right: 15),
              alignment: Alignment.center,
              width: double.infinity,
              height: 50,
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.green,
              ),
              child: const Text(
                "Log In",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Material(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(5),
            child: InkWell(
              onTap: () {
                print('Bosilish effekti');
              },
              borderRadius: BorderRadius.circular(5),
              // splashColor: Colors.white.withOpacity(0.5),
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Effektli Tugma',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          AnimatedButton(),
          Platform.isIOS
              ? CupertinoButton(
                  onPressed: () {
                    print('CupertinoButton bosildi!');
                  },
                  child: Text('iOS Tugma'),
                )
              : ElevatedButton(
                  onPressed: () {
                    print('ElevatedButton bosildi!');
                  },
                  child: Text('Android Tugma'),
                ),
        ],
      ),
    );
  }
}

void navigateToProfile(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const ProfileScreen(),
    ),
  );
}
