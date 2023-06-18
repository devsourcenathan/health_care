import 'package:flutter/material.dart';

// Dart imports:
import 'dart:math';

// Project imports:
import '../screens/call/call_page.dart';

//Zegocloud config provider

var appSign =
    "88a4e2a31d439c7788d5bc89b40507151365d8ae1e1e4a95d332f09d037e8bcd";
var appID = 400406973;

class PageRouteNames {
  static const String login = '/login';
  static const String home = '/home_page';
  static const String call = '/call';
}

class PageParam {
  static const String localUserID = 'local_user_id';
  static const String call_id = 'call_id';
}

/// Note that the userID needs to be globally unique,
final String localUserID = Random().nextInt(10000).toString();

const TextStyle textStyle = TextStyle(
  color: Colors.black,
  fontSize: 13.0,
  decoration: TextDecoration.none,
);

Map<String, WidgetBuilder> routes = {
  // PageRouteNames.login: (context) => const LoginPage(),
  // PageRouteNames.home: (context) => const HomePage(),
  PageRouteNames.call: (context) => CallPage(
        callID: '',
      ),
};

class UserInfo {
  String id = '';
  String name = '';

  UserInfo({
    required this.id,
    required this.name,
  });

  bool get isEmpty => id.isEmpty;

  UserInfo.empty();
}

UserInfo currentUser = UserInfo.empty();
const String cacheUserIDKey = 'cache_user_id_key';
