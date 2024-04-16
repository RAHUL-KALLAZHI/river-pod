import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/user.dart';

part 'user_state.freezed.dart';

@freezed
abstract class UserState with _$UserState {
  const factory UserState() = Initial;
  const factory UserState.loading() = Loading;
  const factory UserState.loaded(User user) = UserData;
  const factory UserState.error({required String message}) = Error;
}
