import 'package:freezed_annotation/freezed_annotation.dart';

import 'user.entity.dart';

part 'auth_session.entity.freezed.dart';

@freezed
abstract class AuthSession with _$AuthSession {
  const factory AuthSession({
    required UserEntity user,
    required String accessToken,
    required String refreshToken,
  }) = _AuthSession;
}
