import 'package:flutter/material.dart';
import 'circle_image.dart';

class Card2 extends StatelessWidget {
  const Card2({
    Key? key,
    required this.bgImage,
    required this.authorImage,
    required this.authorName,
    required this.role,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final ImageProvider bgImage;
  final ImageProvider authorImage;
  final String authorName;
  final String role;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(width: 350, height: 450),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: bgImage,
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AuthorCard(
            image: authorImage,
            name: authorName,
            description: role,
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
                      subtitle,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  child: Text(
                    title,
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
  State<FavoriteIcon> createState() => FavoriteIconState();
}

class FavoriteIconState extends State<FavoriteIcon> {
  bool isFavorited = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() => isFavorited = !isFavorited);
      },
      icon: Icon(
        isFavorited ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
    );
  }
}