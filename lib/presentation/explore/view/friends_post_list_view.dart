import 'package:flutter/material.dart';
import 'package:fooderlich_app/api/models/models.dart';

import '../components/components.dart';

class FriendsPostListView extends StatelessWidget {
  const FriendsPostListView({
    Key? key,
    required this.posts,
  }) : super(key: key);

  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12,
        right: 12,
        bottom: 12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Social Chefs',
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(
            height: 400,
            child: ListView.separated(
              shrinkWrap: true,
              primary: false,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: posts.length,
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemBuilder: (context, index) {
                return _FriendPostListTile(post: posts[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _FriendPostListTile extends StatelessWidget {
  const _FriendPostListTile({
    Key? key,
    required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleImage(
          image: AssetImage(post.profileImageUrl),
          radius: 20,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                post.comment,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const SizedBox(height: 2),
              Text(
                '${post.timestamp} minutes ago',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const SizedBox(height: 6),
            ],
          ),
        ),
      ],
    );
  }
}
