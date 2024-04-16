import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user.dart';
import '../application/providers.dart';
import 'styled_text.dart';

class HomePageLoaded extends ConsumerWidget {
  final User user;
  final TextEditingController _userIdController = TextEditingController();

  HomePageLoaded({super.key, required this.user});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(user.data.avatar),
            StyledText('NAME: ${user.data.firstName} ${user.data.lastName}'),
            StyledText('EMAIL: ${user.data.email}'),
            StyledText('ID: ${user.data.id}'),
            TextField(
              controller: _userIdController,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                ref
                    .read(userNotifierProvider.notifier)
                    .getUserInfo(_userIdController.text);
              },
              child: const Text('Get user info'),
            ),
          ],
        ),
      ),
    );
  }
}
