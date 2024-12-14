import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:example/core/deep_link/deep_link_interpreter.dart';
import 'package:flutter/material.dart';

/// Deeplink adb test command format
/// adb shell am start -a android.intent.action.VIEW \ -d "edd://?jwt=your_jwt_token"
///
/// Example deeplink adb test command
/// adb shell am start -a android.intent.action.VIEW \ -d "edd://?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmdWxsTmFtZSI6IkVtcmUgUmV5aGFubGlvZ2x1IiwiY2l0eSI6IkxvbmRvbiIsIm51bWJlck9mUGVvcGxlIjozLCJzdGFydERhdGUiOiIxOC4wMS4yMDI1IiwiZW5kRGF0ZSI6IjI1LjAxLjIwMjUiLCJlbWFpbCI6InJleWhhbmxpb2dsdWVtcmVAZ21haWwuY29tIiwic3VnZ2VzdGVkSG90ZWxJZCI6IjIyMSIsInBob25lTnVtYmVyIjoiKzkwIDUzMyA0NDQgNTUgNjYiLCJpYXQiOjE1MTYyMzkwMjJ9.BNA5c07Mp6D_x7v2Urx7lXY0xYKeJgcM5NIlOaDzcXs"
class DeepLinkListener extends StatefulWidget {
  const DeepLinkListener({required this.child, super.key});

  final Widget child;

  @override
  State<DeepLinkListener> createState() => _DeepLinkListenerState();
}

class _DeepLinkListenerState extends State<DeepLinkListener> {
  late final appLinks = AppLinks();

  StreamSubscription<Uri>? uriSubscription;

  Future<bool> init() async {
    uriSubscription = appLinks.uriLinkStream.listen(processUriLink);
    await appLinks.getInitialLink();
    return true;
  }

  void processUriLink(Uri? uri) {
    if (uri == null) {
      return;
    }

    final jwt = uri.queryParameters["jwt"];
    if (jwt == null) {
      return;
    }
    DeepLinkInterpreter().interpretFromJwt(jwt);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: init(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          return Center(child: widget.child);
        }
    );
  }

  @override
  void dispose() {
    uriSubscription?.cancel();
    super.dispose();
  }
}
