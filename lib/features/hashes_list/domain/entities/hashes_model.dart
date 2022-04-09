import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'hashes_model.g.dart';

@CopyWith()
@HiveType(typeId: 0)
class HashesModel extends Equatable {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final DateTime stamp;

  @HiveField(2)
  final List<String> hashes;

  const HashesModel({
    required this.name,
    required this.stamp,
    required this.hashes,
  });

  String get shareText => hashes.join('\n');

  @override
  List<Object?> get props => [name, stamp, hashes.join()];
}
