// packages
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:fooderlich_app/api/models/models.dart';
import 'package:fooderlich_app/presentation/components/circle_image.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            context.router.pop();
          },
        ),
      ),
      body: Center(
        child: Builder(builder: (context) {
          bool isDarkMode = false;
          final user = User(
            lastName: 'Nwaneri',
            firstName: 'David',
            profileImageUrl: 'assets/profile_pics/my_dashatar.png',
            points: 4000,
            role: 'Flutter Developer',
            darkMode: isDarkMode,
          );
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              BuildProfile(user: user),
              Expanded(
                  child: BuildMenu(
                darkMode: isDarkMode,
              )),
            ],
          );
        }),
      ),
    );
  }
}

class BuildProfile extends StatelessWidget {
  const BuildProfile({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleImage(
          image: AssetImage(user.profileImageUrl),
          radius: 60.0,
        ),
        const SizedBox(height: 16.0),
        Text(
          user.firstName,
          style: const TextStyle(
            fontSize: 21,
          ),
        ),
        Text(user.role),
        Text(
          '${user.points} points',
          style: const TextStyle(
            fontSize: 30,
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}

class BuildMenu extends StatelessWidget {
  const BuildMenu({
    Key? key,
    required this.darkMode,
  }) : super(key: key);

  final bool darkMode;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: const Text('Dark mode'),
          trailing: Switch(
            value: darkMode,
            onChanged: (value) {},
          ),
        ),
        ListTile(
          title: const Text('View developer\'s profile '),
          onTap: () {},
        ),
        ListTile(
          title: const Text('Log out'),
          onTap: () {},
        ),
      ],
    );
  }
}
