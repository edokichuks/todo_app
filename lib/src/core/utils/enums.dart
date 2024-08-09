// Package imports:
import 'package:json_annotation/json_annotation.dart';

enum LoadState { loading, idle, success, error, loadmore, done }

enum LoginLoadState { loading, idle, success, error, unverified }

enum CurrentState { loggedIn, onboarded, initial }

enum OverLayType { loader, message, none }

enum MessageType { error, success }

enum PermissionStatus {
  denied,
  deniedForever,
  whileInUse,
  always,
  unableToDetermine,
  initial
}

enum HomeSessionState { logout, initial }

// ignore: constant_identifier_names
enum Currency { NGN, USD }

@JsonEnum()
enum Status {
  pending,
  processing,
  dispatching,
  enroute,
  rejected,
  cancelled,
  unfulfilled,
  delivered,
  completed,
}

extension LoadExtension on LoadState {
  bool get isLoading => this == LoadState.loading;
  bool get isLoaded => this == LoadState.success;
  bool get isError => this == LoadState.error;
  bool get isInitial => this == LoadState.idle;
  bool get isLoadMore => this == LoadState.loadmore;
  bool get isCompleted => this == LoadState.done;
}
