import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import '../screens/detail_screen.dart';

class GridExample extends StatelessWidget {
  final String detail;
  final String imageURL;

  GridExample({
    required this.detail,
    required this.imageURL,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.2,
      ),
      itemBuilder: (BuildContext _buildContext, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: OpenContainer(
            transitionType: ContainerTransitionType.fade,
            transitionDuration: const Duration(milliseconds: 800),
            closedBuilder: (BuildContext _, VoidCallback openContainer) {
              return GestureDetector(
                onTap: openContainer,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(imageURL),
                      radius: 50,
                    ),
                    const SizedBox(height: 8),
                    Text("Ragnar $index"),
                  ],
                ),
              );
            },
            openBuilder: (BuildContext _, VoidCallback __) {
              return DetailScreen(
                title: "Ragnar $index",
                imageUrl: imageURL,
                detail: detail,
              );
            },
          ),
        );
      },
    );
  }
}