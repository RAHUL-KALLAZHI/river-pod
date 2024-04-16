import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../application/state/user_state.dart';
import '../application/providers.dart';
import '../widgets/home_page_error.dart';
import '../widgets/home_page_initial.dart';
import '../widgets/home_page_loaded.dart';
import '../widgets/home_page_loading.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, watch, child) {
          final state = watch.watch(userNotifierProvider) as UserState;

          return state.when(
            () => HomePageInitial(),
            loading: () => const HomePageLoading(),
            loaded: (userInfo) => HomePageLoaded(user: userInfo),
            error: (message) => HomePageError(message: message),
          );
        },
      ),
    );
  }
}
