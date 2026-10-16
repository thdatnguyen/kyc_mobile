import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/admin/presentation/views/admin_review_detail_view.dart';
import '../../features/admin/presentation/views/admin_view.dart';
import '../../features/application/domain/entities/application.entities.dart';
import '../../features/application/presentation/views/home_view.dart';
import '../../features/application/presentation/views/kyc_flow_view.dart';
import '../../features/application/presentation/views/submission_detail_view.dart';
import '../../features/auth/presentation/adapter/auth.adapter.dart';
import '../../features/auth/presentation/state/auth.state.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/register_view.dart';
import '../../features/splash/splash_view.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(Ref ref) {
  final authState = ref.watch(authControllerProvider);

  String? redirect(BuildContext context, GoRouterState state) {
    final loc = state.matchedLocation;
    final isAuthRoute = loc.startsWith('/login') || loc.startsWith('/register');

    if (authState is AuthInitial) {
      return loc == SplashView.path ? null : SplashView.path;
    }

    if (authState is! AuthAuthenticated) {
      return isAuthRoute ? null : LoginView.path;
    }

    final home = authState.user.role == 'Admin' ? AdminView.path : HomeView.path;
    if (isAuthRoute || loc == SplashView.path) return home;
    return null;
  }

  return GoRouter(
    initialLocation: SplashView.path,
    redirect: redirect,
    routes: [
      GoRoute(path: SplashView.path, builder: (_, _) => const SplashView()),
      GoRoute(path: LoginView.path, builder: (_, _) => const LoginView()),
      GoRoute(path: RegisterView.path, builder: (_, _) => const RegisterView()),
      GoRoute(path: HomeView.path, builder: (_, _) => const HomeView()),
      GoRoute(path: KycFlowView.path, builder: (_, _) => const KycFlowView()),
      GoRoute(
        path: SubmissionDetailView.path,
        builder: (_, state) =>
            SubmissionDetailView(submission: state.extra as SubmissionEntity),
      ),
      GoRoute(path: AdminView.path, builder: (_, _) => const AdminView()),
      GoRoute(
        path: AdminReviewDetailView.path,
        builder: (_, state) =>
            AdminReviewDetailView(submission: state.extra as SubmissionEntity),
      ),
    ],
  );
}
