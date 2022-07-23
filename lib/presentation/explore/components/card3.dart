import 'package:flutter/material.dart';

class Card3 extends StatelessWidget {
  const Card3({
    Key? key,
    required this.bgImage,
    required this.tags,
    required this.title,
  }) : super(key: key);

  final ImageProvider bgImage;
  final List<String> tags;
  final String title;

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
      child: Stack(
        children: [
          const _BuidDarkBackground(),
          _BuildHeading(title: title),
          _BuildChips(tags: tags),
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
    required this.title,
  }) : super(key: key);

  final String title;

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
          const SizedBox(height: 8),
          Text(
            title,
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
    required this.tags,
  }) : super(key: key);

  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        spacing: 12,
        runSpacing: 8,
        children: tags
            .map((tag) => Chip(
                  elevation: 4,
                  label: Text(tag),
                  backgroundColor: Colors.grey.shade900,
                  labelStyle: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.white),
                ))
            .toList(),
      ),
    );
  }
}
