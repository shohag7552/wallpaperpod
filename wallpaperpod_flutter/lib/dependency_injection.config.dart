// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:wallpaperpod_client/wallpaperpod_client.dart';
import 'package:wallpaperpod_flutter/wallpaperpod_client_module.dart';

extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final wallpaperpodClientModule = WallpaperClientModule();
    gh.factory<Client>(() => wallpaperpodClientModule.client);
    // gh.factory<ServiceB>(ServiceA(getIt<ServiceA>()));
    return this;
  }
}
