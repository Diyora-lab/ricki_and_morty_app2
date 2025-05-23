// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i5;
import 'package:ricki_and_morty_app2/modules/characters_list/domain/entity/characters_entity.dart'
    as _i4;
import 'package:ricki_and_morty_app2/modules/home/home_screen.dart' as _i1;
import 'package:ricki_and_morty_app2/modules/home/profile/profile_characters_screen.dart'
    as _i2;

/// generated route for
/// [_i1.HomeScreen]
class HomeRoute extends _i3.PageRouteInfo<void> {
  const HomeRoute({List<_i3.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomeScreen();
    },
  );
}

/// generated route for
/// [_i2.ProfileCharactersScreen]
class ProfileCharactersRoute
    extends _i3.PageRouteInfo<ProfileCharactersRouteArgs> {
  ProfileCharactersRoute({
    required _i4.CharactersEntity characters,
    _i5.Key? key,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          ProfileCharactersRoute.name,
          args: ProfileCharactersRouteArgs(
            characters: characters,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfileCharactersRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProfileCharactersRouteArgs>();
      return _i2.ProfileCharactersScreen(
        characters: args.characters,
        key: args.key,
      );
    },
  );
}

class ProfileCharactersRouteArgs {
  const ProfileCharactersRouteArgs({
    required this.characters,
    this.key,
  });

  final _i4.CharactersEntity characters;

  final _i5.Key? key;

  @override
  String toString() {
    return 'ProfileCharactersRouteArgs{characters: $characters, key: $key}';
  }
}
