import 'package:flutter/material.dart';

class Card2 extends StatelessWidget {
  const Card2({
    Key? key,
    // required this.bgImage,
    // required this.authorImage,
    // required this.authorName,
    // required this.authorDescription,
  }) : super(key: key);

// all this should be uncommented when we use real data
// the same also applie in the constructor
  // final ImageProvider bgImage;
  // final ImageProvider authorImage;
  // final String authorName;
  // final String authorDescription;
// end of uncommenting

  // all this should be discarded when we use the real data
  static const _bgImage = AssetImage('assets/magazine_pics/card_smoothie.png');
  static const _authorImage = AssetImage('assets/profile_pics/person_manda.png');
  static const _authorName = 'Jean-Pierre';
  static const _authorDescription = 'The Art of Baking';
  // end of the discardable code

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(width: 350, height: 450),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          image: _bgImage,
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const AuthorCard(
            image: _authorImage,
            name: _authorName,
            description: _authorDescription,
          ),
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  bottom: 70,
                  left: 16,
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      'Smothie',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  child: Text(
                    'Recipe',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AuthorCard extends StatelessWidget {
  const AuthorCard({
    Key? key,
    required this.image,
    required this.name,
    required this.description,
  }) : super(key: key);

  final ImageProvider image;
  final String name;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleImage(image: image),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: Theme.of(context).textTheme.headline5),
                  Text(description, style: Theme.of(context).textTheme.headline6),
                ],
              ),
            ],
          ),
          const FavoriteIcon(),
        ],
      ),
    );
  }
}

class FavoriteIcon extends StatefulWidget {
  const FavoriteIcon({Key? key}) : super(key: key);

  @override
  State<FavoriteIcon> createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  bool _isFavorited = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() => _isFavorited = !_isFavorited);
      },
      icon: Icon(
        _isFavorited ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
    );
  }
}

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
        radius: radius - 5,
        backgroundImage: image,
      ),
    );
  }
}
