import 'package:flutter/material.dart';

class Card1 extends StatelessWidget {
  const Card1({
    Key? key,
    required this.image,
    required this.title,
    required this.message,
    required this.authorName,
    required this.subtitle,
  }) : super(key: key);

  final ImageProvider image;
  final String subtitle;
  final String title;
  final String message;
  final String authorName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      constraints: const BoxConstraints.expand(width: 350, height: 450),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: image,
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.white),
          ),
          Positioned(
            top: 20,
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white),
            ),
          ),
          Positioned(
            bottom: 30,
            right: 0,
            child: Text(
              message,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.white),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 0,
            child: Text(
              authorName,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
