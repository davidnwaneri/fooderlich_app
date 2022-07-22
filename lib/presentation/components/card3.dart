import 'package:flutter/material.dart';

class Card3 extends StatelessWidget {
  const Card3({Key? key}) : super(key: key);

  static const _bgImage = AssetImage('assets/magazine_pics/card_carrot.png');

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
      child: Stack(
        children: const [
          _BuidDarkBackground(),
          _BuildHeading(),
          _BuildChips(),
        ],
      ),
    );
  }
}

class _BuidDarkBackground extends StatelessWidget {
  const _BuidDarkBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black.withOpacity(0.7),
      ),
    );
  }
}

class _BuildHeading extends StatelessWidget {
  const _BuildHeading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.book,
            color: Colors.white,
            size: 40,
          ),
          Text(
            'Recipe',
            style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class _BuildChips extends StatelessWidget {
  const _BuildChips({
    Key? key,
  }) : super(key: key);

  static const _tags = [
    'Dessert',
    'Cake',
    'Cupcake',
    'Cookies',
    'Candy',
    'Ice cream',
    'Dessert',
    'Cake',
    'Cupcake',
    'Cookies',
    'Candy',
    'Ice cream',
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: _tags
            .map((tag) => Chip(
                  label: Text(tag),
                  backgroundColor: Colors.grey.shade900,
                  labelStyle: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.white),
                ))
            .toList(),
      ),
    );
  }
}
