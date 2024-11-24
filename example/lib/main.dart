import 'package:example/core/widgets/deep_link_listener/deep_link_listener.dart';
import 'package:example/dashboard/dashboard_page.dart';
import 'package:flutter/material.dart';

void main() {
  // adb shell am start -a android.intent.action.VIEW -d "edd://?eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmdWxsTmFtZSI6IkVtcmUgUmV5aGFubGlvZ2x1IiwiY2l0eSI6IkxvbmRvbiIsIm51bWJlck9mUGVvcGxlIjozLCJzdGFydERhdGUiOiIxOC4wMS4yMDI1IiwiZW5kRGF0ZSI6IjI1LjAxLjIwMjUiLCJlbWFpbCI6InJleWhhbmxpb2dsdWVtcmVAZ21haWwuY29tIiwic3VnZ2VzdGVkSG90ZWxJZCI6IjIyMSIsInBob25lTnVtYmVyIjoiKzkwIDUzMyA0NDQgNTUgNjYiLCJpYXQiOjE1MTYyMzkwMjJ9.BNA5c07Mp6D_x7v2Urx7lXY0xYKeJgcM5NIlOaDzcXs"
  const jwt =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmdWxsTmFtZSI6IkVtcmUgUmV5aGFubGlvZ2x1IiwiY2l0eSI6IkxvbmRvbiIsIm51bWJlck9mUGVvcGxlIjozLCJzdGFydERhdGUiOiIxOC4wMS4yMDI1IiwiZW5kRGF0ZSI6IjI1LjAxLjIwMjUiLCJlbWFpbCI6InJleWhhbmxpb2dsdWVtcmVAZ21haWwuY29tIiwic3VnZ2VzdGVkSG90ZWxJZCI6IjIyMSIsInBob25lTnVtYmVyIjoiKzkwIDUzMyA0NDQgNTUgNjYiLCJpYXQiOjE1MTYyMzkwMjJ9.BNA5c07Mp6D_x7v2Urx7lXY0xYKeJgcM5NIlOaDzcXs";
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DeepLinkListener(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const DashboardPage(),
      ),
    );
  }
}
