/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class Wallpaper extends _i1.SerializableEntity {
  Wallpaper._({
    this.id,
    required this.name,
    required this.image,
    required this.date,
  });

  factory Wallpaper({
    int? id,
    required String name,
    required String image,
    required DateTime date,
  }) = _WallpaperImpl;

  factory Wallpaper.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Wallpaper(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      name: serializationManager.deserialize<String>(jsonSerialization['name']),
      image:
          serializationManager.deserialize<String>(jsonSerialization['image']),
      date:
          serializationManager.deserialize<DateTime>(jsonSerialization['date']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  String image;

  DateTime date;

  Wallpaper copyWith({
    int? id,
    String? name,
    String? image,
    DateTime? date,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'image': image,
      'date': date.toJson(),
    };
  }
}

class _Undefined {}

class _WallpaperImpl extends Wallpaper {
  _WallpaperImpl({
    int? id,
    required String name,
    required String image,
    required DateTime date,
  }) : super._(
          id: id,
          name: name,
          image: image,
          date: date,
        );

  @override
  Wallpaper copyWith({
    Object? id = _Undefined,
    String? name,
    String? image,
    DateTime? date,
  }) {
    return Wallpaper(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      date: date ?? this.date,
    );
  }
}
