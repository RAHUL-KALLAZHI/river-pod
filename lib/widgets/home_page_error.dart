import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../application/providers.dart';

class HomePageError extends ConsumerWidget {
  final String message;
  final TextEditingController _userIdController = TextEditingController();

  HomePageError({super.key, required this.message});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _userIdController,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              ref
                  .read(userNotifierProvider.notifier)
                  .getUserInfo(_userIdController.text);
            },
            child: const Text('Get user info'),
          ),
          Text(
            message,
            style: const TextStyle(color: Colors.red),
          ),
        ],
      ),
    );
  }
}
