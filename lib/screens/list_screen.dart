import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../widgets/list_example.dart';
import '../widgets/grid_example.dart';

const String _ragnarParagrapgh =
    'Originally a farmer, Viking Ragnar Lothbrok claims to be descended from '
    'the god Odin. He becomes Earl of Kattegat after he challenges and kills '
    'the ruthless Earl Haraldson. He is also a feared warrior, becomes a raider '
    'of undiscovered lands, and, eventually, King of Denmark. Despite his '
    'reputation for ruthlessness and brutality, he is a curious man eager to '
    'learn about other cultures. Based on the semi-legendary Ragnar '
    'Lodbrok..\n';

const String _image1 = 'https://wallpapercave.com/wp/wp2040421.jpg';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  bool _showList = true;
  bool _slowAnimations = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "List and Grid Animations",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.swap_horiz),
            color: Colors.white,
            onPressed: () {
              setState(() {
                _showList = !_showList;
              });
            },
          ),
        ],
      ),
      body: PageTransitionSwitcher(
        transitionBuilder: (
          Widget child,
          Animation<double> animation, // defines how new child appears
          Animation<double> secondaryAnimation,
          // defines how old child disappears
        ) {
          return FadeThroughTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          );
        },
        child: _showList
            ? ListExample(
                detail: _ragnarParagrapgh,
                imageURL: _image1,
              )
            : GridExample(
                detail: _ragnarParagrapgh,
                imageURL: _image1,
              ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SwitchListTile(
          value: _slowAnimations,
          onChanged: (value) async {
            setState(() {
              _slowAnimations = value;
            });
            if (_slowAnimations) {
              await Future.delayed(
                Duration(milliseconds: 300),
              );
            }
            timeDilation = _slowAnimations
                ? 8.0
                : 1.0; // Will slow down animations by a factor
          },
          title: const Text("Slow Animation"),
        ),
      ),
    );
  }
}
