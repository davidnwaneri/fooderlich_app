import 'package:flutter/material.dart';

// The CircleImage component is used to display a circle image.
// It is used in the Explore screen, the ExploreRecipesListView component [Card2], and the ExploreFriendsPostListView component.
// So it was split into a separate component/file to make it easier to reuse.

class CircleImage extends StatelessWidget {
  const CircleImage({
    Key? key,
    required this.image,
    this.radius = 28,
  }) : super(key: key);

  final ImageProvider image;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: radius - 3,
        backgroundImage: image,
      ),
    );
  }
}
