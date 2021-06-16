import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import '../screens/detail_screen.dart';

class ListExample extends StatelessWidget {
  final String detail;
  final String imageURL;

  ListExample({
    required this.detail,
    required this.imageURL,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext _, int index) {
        return Container(
          margin: const EdgeInsets.all(5),
          child: OpenContainer(
            transitionType: ContainerTransitionType.fade,
            transitionDuration: const Duration(milliseconds: 800),
            closedBuilder: (BuildContext _, VoidCallback openContainer) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                    imageURL,
                  ),
                ),
                title: Text("Ragnar $index"),
                onTap: openContainer,
              );
            },
            openBuilder: (BuildContext _, VoidCallback __) {
              return DetailScreen(
                title: "Ragnar $index",
                detail: detail,
                imageUrl: imageURL,
              );
            },
          ),
        );
      },
    );
  }
}
