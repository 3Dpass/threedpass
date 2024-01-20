import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'contact.g.dart';

@HiveType(typeId: 8)
class Contact extends Equatable {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String address;

  const Contact({
    required this.name,
    required this.address,
  });

  @override
  List<Object?> get props => [name];
}
