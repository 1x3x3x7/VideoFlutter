import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:video_flutter/router/app_routes.dart';

@immutable
class AppState {
  final bool isLoading;
  final List<String> route;

  AppState({
    this.isLoading = false,
    this.route = const [AppRoutes.home_screen],
  });

  factory AppState.initial() {
    return AppState(isLoading: true);
  }

  AppState copyWith({
    bool? isLoading,
    List<String>? route,
  }) {
    return AppState(
      isLoading: isLoading ?? this.isLoading,
      route: route ?? this.route,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          route == other.route;

  @override
  String toString() {
    return '${const JsonEncoder.withIndent(' ').convert(this)}';
  }

  @override
  int get hashCode => isLoading.hashCode ^ route.hashCode;
}
