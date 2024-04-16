import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'notifier/user_notifier.dart';
import '../utils/user_client.dart';

final userClientProvider = Provider<UserClient>((ref) => UserClient());

final userNotifierProvider =
    StateNotifierProvider((ref) => UserNotifier(ref.watch(userClientProvider)));
