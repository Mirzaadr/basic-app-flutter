import 'package:flutter/material.dart';
import 'package:flutter_application/features/auth/presentation/providers/auth_providers.dart';
import 'package:flutter_application/features/auth/presentation/view/forgot_password/forgot_password_screen.dart';
import 'package:flutter_application/features/auth/presentation/view/profile/profile_screen.dart';
import 'package:flutter_application/features/auth/presentation/view/sign_in/sign_in_screen.dart';
import 'package:flutter_application/features/auth/presentation/view/sign_up/sign_up_screen.dart';
import 'package:flutter_application/features/home/presentation/home_screen.dart';
import 'package:flutter_application/features/onboarding/data/onboarding_repository.dart';
import 'package:flutter_application/features/onboarding/presentation/onboarding_screen.dart';
import 'package:flutter_application/routes/go_router_refresh_stream.dart';
import 'package:flutter_application/routes/scaffold_with_nested_navigation.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

final _key = GlobalKey<NavigatorState>();
enum AppRoute {
  onboarding,
  signIn,
  signUp,
  forgotPassword,
  home,
  jobs,
  job,
  addJob,
  editJob,
  entry,
  addEntry,
  editEntry,
  entries,
  profile,
}


@riverpod
GoRouter appRouter(AppRouterRef ref) {
// GoRouter appRouter() {
  final authRepository = ref.watch(authRepositoryProvider);
  final onboardingRepository = ref.watch(onboardingRepositoryProvider);
  return GoRouter(
    navigatorKey: _key,
    initialLocation: '/auth',
    redirect: (BuildContext context, GoRouterState state) {
      final didCompleteOnboarding = onboardingRepository.isOnboardingComplete();
      // print('Complete onboarding? ${didCompleteOnboarding.toString()}');
      final path = state.uri.path;
      if (!didCompleteOnboarding) {
        // Always check state.subloc before returning a non-null route
        // https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/redirection.dart#L78
        return '/onboarding';
        // if (path != '/onboarding') {
        //   return '/onboarding';
        // }
      }
      final isAuthenticated = authRepository.currentUser != null;
      // print('isAuthenticated: $isAuthenticated, path: $path');
      // if (!isAuthenticated) {
      //   if (!path.startsWith('/auth')) {
      //     return '/auth';
      //   }
      // }
      if (isAuthenticated) {
        if (path.startsWith('/auth')) {
          return '/home';
        }
      } else {
        if (!path.startsWith('/auth')) {
          return '/auth';
        }
      }
      return null;

      // if (state.fullPath == '/${AppRoute.signIn.name}') {
      //   return isAuthenticated ? null : '/${AppRoute.signIn.name}';
      // }
      // /// null redirects to Initial Location

      // return isAuthenticated ? null : '/${AppRoute.splash.name}';
    },
    refreshListenable: GoRouterRefreshStream(authRepository.authStateChanges()),
    routes: [
      GoRoute(
        path: '/onboarding',
        name: AppRoute.onboarding.name,
        // pageBuilder: (context, state) => const NoTransitionPage(
        //   child: Scaffold()
        // ),
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/auth',
        name: AppRoute.signIn.name,
        // builder: (context, state) => const SignInScreen(),
        pageBuilder: (context, state) => const NoTransitionPage(
          child: SignInScreen()
        ),
        routes: [
          GoRoute(
            // path: 'signUp',
            path: AppRoute.signUp.name,
            name: AppRoute.signUp.name,
            // builder: (context, state) => const SignUpScreen(),
            pageBuilder: (context, state) => const NoTransitionPage(
              child: SignUpScreen()
            ),
          ),
          GoRoute(
            // path: 'forgotPassword',
            path: AppRoute.forgotPassword.name,
            name: AppRoute.forgotPassword.name,
            // builder: (context, state) => const SignUpScreen(),
            pageBuilder: (context, state) => NoTransitionPage(
              child: ForgotPasswordScreen()
            ),
          ),
        ]
      ),
      // GoRoute(
      //   path: '/signIn',
      //   name: AppRoute.signIn.name,
      //   // builder: (context, state) => const SignInScreen(),
      //   pageBuilder: (context, state) => const NoTransitionPage(
      //     child: SignInScreen()
      //   ),
      // ),
      // GoRoute(
      //   path: '/signUp',
      //   name: AppRoute.signUp.name,
      //   // builder: (context, state) => const SignUpScreen(),
      //   pageBuilder: (context, state) => const NoTransitionPage(
      //     child: SignUpScreen()
      //   ),
      // ),
      // GoRoute(
      //   // path: '/home',
      //   path: '/${AppRoute.home.name}',
      //   name: AppRoute.home.name,
      //   // builder: (context, state) => const SignUpScreen(),
      //   pageBuilder: (context, state) => const NoTransitionPage(
      //     child: HomeScreen()
      //   ),
      // ),
      // GoRoute(
      //   // path: '/home',
      //   path: '/${AppRoute.profile.name}',
      //   name: AppRoute.profile.name,
      //   // builder: (context, state) => const ProfileScreen(),
      //   pageBuilder: (context, state) => const NoTransitionPage(
      //     child: ProfileScreen()
      //   ),
      // ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            // navigatorKey: _jobsNavigatorKey,
            routes: [
              GoRoute(
                path: '/${AppRoute.home.name}',
                name: AppRoute.home.name,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: HomeScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            // navigatorKey: _entriesNavigatorKey,
            routes: [
              GoRoute(
                path: '/${AppRoute.profile.name}',
                name: AppRoute.profile.name,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: ProfileScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            // navigatorKey: _entriesNavigatorKey,
            routes: [
              GoRoute(
                path: '/${AppRoute.jobs.name}',
                name: AppRoute.jobs.name,
                pageBuilder: (context, state) => NoTransitionPage(
                  child: Scaffold(
                    appBar: AppBar(
                      title: const Text("Screen 3"),
                    ),
                    body: const Center(
                      child: Text("Screen 3"),
                    ),
                  ),
                ),
              ),
            ],
          ),
          
        ],
      )
    ]
  );
}