import 'package:example/core/deep_link/deep_link_listener.dart';
import 'package:example/core/navigation/navigation_listener_cubit.dart';
import 'package:example/dashboard/dashboard_page.dart';
import 'package:example/hotel_selection/hotel_selection_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

final globalNavigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationListenerCubit(),
      child: BlocBuilder<NavigationListenerCubit, NavigationListenerState>(
        builder: (context, state) {
          return DeepLinkListener(
            child: MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              navigatorKey: globalNavigatorKey,
              initialRoute: '/dashboard',
              onGenerateRoute: (settings) {
                final routeUri = settings.name is String ? Uri.tryParse(settings.name as String) : null;

                final arguments = routeUri?.queryParameters ?? {};

                switch (routeUri?.path ?? "") {
                  case '/dashboard':
                    return MaterialPageRoute(builder: (context) => const DashboardPage());
                  case '/hotel-selection':
                    return MaterialPageRoute(
                      builder: (context) => HotelSelectionPage(
                        city: arguments['city'] as String,
                        dateRange: arguments['dateRange'] as String,
                        numberOfPeople: int.parse(arguments['numberOfPeople'] as String),
                      ),
                    );
                }
              },
            ),
          );
        },
      ),
    );
  }
}
