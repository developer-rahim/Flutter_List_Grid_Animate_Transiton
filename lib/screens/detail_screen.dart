import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final String title;
  final String detail;
  final String imageUrl;

  const DetailScreen({
    Key? key,
    required this.title,
    required this.detail,
    required this.imageUrl,
  });

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool _largePhoto = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Text(
          "Detail Screen",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: PageTransitionSwitcher(
        duration: const Duration(milliseconds: 300),
        reverse: !_largePhoto,
        transitionBuilder: (
          Widget child,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) {
          return SharedAxisTransition(
            child: child,
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            transitionType: SharedAxisTransitionType.scaled,
          );
        },
        child: _largePhoto
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    _largePhoto = !_largePhoto;
                  });
                },
                child: Image.network(
                  widget.imageUrl,
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _largePhoto = !_largePhoto;
                        });
                      },
                      child: Container(
                        height: 300,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(500),
                          image: DecorationImage(
                            image: NetworkImage(widget.imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Text(widget.title),
                    const SizedBox(height: 20.0),
                    Text(widget.detail),
                  ],
                ),
              ),
      ),
    );
  }
}
