// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../features/compare_page.dart/presentation/pages/compare_page.dart'
    as _i5;
import '../features/hashes_list/domain/entities/hash_object.dart' as _i8;
import '../features/hashes_list/domain/entities/snapshot.dart' as _i9;
import '../features/home_page/presentation/pages/home_page.dart' as _i1;
import '../features/result_page/presentation/pages/preview_page.dart' as _i4;
import '../features/result_page/presentation/pages/preview_page_wrapper.dart'
    as _i2;
import '../features/settings_page/presentation/pages/settings_page.dart' as _i3;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    PreviewRoute.name: (routeData) {
      final args = routeData.argsAs<PreviewRouteArgs>();
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.PreviewPageWrapper(
              key: args.key,
              hashObject: args.hashObject,
              snapshot: args.snapshot));
    },
    SettingsRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.SettingsPage());
    },
    PreviewPage.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.PreviewPage());
    },
    CompareRoute.name: (routeData) {
      final args = routeData.argsAs<CompareRouteArgs>();
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i5.ComparePage(
              key: args.key,
              origObj: args.origObj,
              comparisons: args.comparisons));
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(HomeRoute.name, path: '/'),
        _i6.RouteConfig(PreviewRoute.name,
            path: '/preview-page-wrapper',
            children: [
              _i6.RouteConfig(PreviewPage.name,
                  path: '', parent: PreviewRoute.name),
              _i6.RouteConfig(CompareRoute.name,
                  path: 'compare-page', parent: PreviewRoute.name)
            ]),
        _i6.RouteConfig(SettingsRoute.name, path: '/settings-page')
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.PreviewPageWrapper]
class PreviewRoute extends _i6.PageRouteInfo<PreviewRouteArgs> {
  PreviewRoute(
      {_i7.Key? key,
      required _i8.HashObject? hashObject,
      required _i9.Snapshot snapshot,
      List<_i6.PageRouteInfo>? children})
      : super(PreviewRoute.name,
            path: '/preview-page-wrapper',
            args: PreviewRouteArgs(
                key: key, hashObject: hashObject, snapshot: snapshot),
            initialChildren: children);

  static const String name = 'PreviewRoute';
}

class PreviewRouteArgs {
  const PreviewRouteArgs(
      {this.key, required this.hashObject, required this.snapshot});

  final _i7.Key? key;

  final _i8.HashObject? hashObject;

  final _i9.Snapshot snapshot;

  @override
  String toString() {
    return 'PreviewRouteArgs{key: $key, hashObject: $hashObject, snapshot: $snapshot}';
  }
}

/// generated route for
/// [_i3.SettingsPage]
class SettingsRoute extends _i6.PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: '/settings-page');

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [_i4.PreviewPage]
class PreviewPage extends _i6.PageRouteInfo<void> {
  const PreviewPage() : super(PreviewPage.name, path: '');

  static const String name = 'PreviewPage';
}

/// generated route for
/// [_i5.ComparePage]
class CompareRoute extends _i6.PageRouteInfo<CompareRouteArgs> {
  CompareRoute(
      {_i7.Key? key,
      required _i9.Snapshot origObj,
      required List<_i9.Snapshot> comparisons})
      : super(CompareRoute.name,
            path: 'compare-page',
            args: CompareRouteArgs(
                key: key, origObj: origObj, comparisons: comparisons));

  static const String name = 'CompareRoute';
}

class CompareRouteArgs {
  const CompareRouteArgs(
      {this.key, required this.origObj, required this.comparisons});

  final _i7.Key? key;

  final _i9.Snapshot origObj;

  final List<_i9.Snapshot> comparisons;

  @override
  String toString() {
    return 'CompareRouteArgs{key: $key, origObj: $origObj, comparisons: $comparisons}';
  }
}
