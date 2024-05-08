
#Server
generate:
	cd wallpaperpod_server && serverpod generate

migration:
	cd wallpaperpod_server && serverpod create-migration

active-serverpod:
	cd wallpaperpod_server && dart pub global activate serverpod_cli

# Flutter app
app-build:
	cd wallpaperpod_flutter && dart run build_runner build --delete-conflicting-outputs

run:
	cd wallpaperpod_flutter && flutter run

#Docker run
run-docker:
	cd wallpaperpod_server && docker compose up --build --detach && dart bin/main.dart --apply-migrations