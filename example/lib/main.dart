import 'package:example/core/deep_link/deep_link_listener.dart';
import 'package:example/core/navigation/navigation_listener_cubit.dart';
import 'package:example/dashboard/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

final _navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationListenerCubit(navigatorKey: _navigatorKey),
      child: DeepLinkListener(
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          navigatorKey: _navigatorKey,
          initialRoute: '/dashboard',
          routes: {
            '/dashboard': (context) => const DashboardPage(),
          },
        ),
      ),
    );
  }
}
