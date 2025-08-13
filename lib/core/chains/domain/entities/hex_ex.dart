import 'package:equatable/equatable.dart';

class HexEx extends Equatable {
  final String noPrefixValue;

  String get prefixValue => '0x$noPrefixValue';

  const HexEx({
    required this.noPrefixValue,
  });

  @override
  List<Object?> get props => [noPrefixValue];
}
