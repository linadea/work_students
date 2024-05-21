import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_screen_state.freezed.dart';

@freezed
class ProfileScreenState with _$ProfileScreenState {
  const factory ProfileScreenState.main() = _Main;
  const factory ProfileScreenState.settings() = _Settings;
  const factory ProfileScreenState.resume() = _Resume;
  const factory ProfileScreenState.notifications() = _Notifications;
}
