// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../data/models/movie.dart' as _i5;
import '../presentation/details/details.dart' as _i2;
import '../presentation/home/home.dart' as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    Home.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.Home());
    },
    Character.name: (routeData) {
      final args = routeData.argsAs<CharacterArgs>();
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.Character(key: args.key, movie: args.movie));
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(Home.name, path: '/'),
        _i3.RouteConfig(Character.name, path: '/Character')
      ];
}

/// generated route for
/// [_i1.Home]
class Home extends _i3.PageRouteInfo<void> {
  const Home() : super(Home.name, path: '/');

  static const String name = 'Home';
}

/// generated route for
/// [_i2.Character]
class Character extends _i3.PageRouteInfo<CharacterArgs> {
  Character({_i4.Key? key, required _i5.Movie movie})
      : super(Character.name,
            path: '/Character', args: CharacterArgs(key: key, movie: movie));

  static const String name = 'Character';
}

class CharacterArgs {
  const CharacterArgs({this.key, required this.movie});

  final _i4.Key? key;

  final _i5.Movie movie;

  @override
  String toString() {
    return 'CharacterArgs{key: $key, movie: $movie}';
  }
}
