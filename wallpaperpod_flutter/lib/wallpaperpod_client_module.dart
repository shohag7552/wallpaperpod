import 'package:injectable/injectable.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:wallpaperpod_client/wallpaperpod_client.dart';

@module
class WallpaperClientModule {
  @lazySingleton
  Client get client => Client(
    'http://$localhost:8080/',
    authenticationKeyManager: FlutterAuthenticationKeyManager(),
  )..connectivityMonitor = FlutterConnectivityMonitor();

  @lazySingleton
  Future<SessionManager> get sessionManager async {
    final sessionManager = SessionManager(
      caller: client.modules.auth,
    );
    await sessionManager.initialize();
    return sessionManager;
  }

}