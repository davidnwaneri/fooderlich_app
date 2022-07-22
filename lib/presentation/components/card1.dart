import 'package:flutter/material.dart';

class Card1 extends StatelessWidget {
  const Card1({
    Key? key,
    // required this.image,
    // required this.title,
    // required this.description,
    // required this.nameOfChef,
    // required this.category,
  }) : super(key: key);

// all this should be uncommented when we use real data
// the same also applie in the constructor
  // final ImageProvider image;
  // final String category;
  // final String title;
  // final String description;
  // final String nameOfChef;
// end of uncommenting

// all this shoudld be discarded when we use the real data
  static const _image = AssetImage('assets/magazine_pics/card_bread.jpg');
  static const _category = 'Editor\'s choice';
  static const _title = 'The Art of Baking';
  static const _nameOfChef = 'Jean-Pierre';
  static const _description = 'Learn to make the best cake';
  // end of the discardable code

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.all(16),
      constraints: const BoxConstraints.expand(width: 350, height: 450),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          image: _image,
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Text(
            _category,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.white),
          ),
          Positioned(
            top: 20,
            child: Text(
              _title,
              style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white),
            ),
          ),
          Positioned(
            bottom: 30,
            right: 0,
            child: Text(
              _description,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.white),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 0,
            child: Text(
              _nameOfChef,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
