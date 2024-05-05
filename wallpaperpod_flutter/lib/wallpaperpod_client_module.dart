import 'package:injectable/injectable.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:wallpaperpod_client/wallpaperpod_client.dart';

@module
class WallpaperClientModule {
  Client get client => Client('http://$localhost:8080/')
    ..connectivityMonitor = FlutterConnectivityMonitor();
}