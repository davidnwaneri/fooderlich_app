import 'package:flutter/material.dart';

import '../components/components.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  static const category = 'Editor\'s choice';
  static const title = 'The Art of Baking';
  static const nameOfChef = 'Jean-Pierre';
  static const description = 'Learn to make the best cake';

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Card3(
      ),
    );
  }
}
