// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:threedpass/core/polkawallet/utils/datetime_from_block_number.dart';
import 'package:threedpass/core/utils/logger.dart';
import 'package:threedpass/features/app/data/cache_database.dart';
import 'package:threedpass/features/chains/domain/entities/hex_ex.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/prop_value.dart';

part 'uploaded_object.g.dart';

class UploadedObject {
  final int id;
  final String stateName; // Approved: 565,330
  final List<int> stateBlock;
  final String compressedWith;
  final Map<String, dynamic> category;
  final int whenCreated;
  final int? whenApproved;
  final String owner;
  final List<PropValueRaw> propsRaw;
  final List<HexEx> hashes;

  const UploadedObject({
    required this.id,
    required this.stateName,
    required this.stateBlock,
    required this.compressedWith,
    required this.category,
    required this.whenCreated,
    required this.whenApproved,
    required this.owner,
    required this.propsRaw,
    required this.hashes,
  });

  factory UploadedObject.fromCache(final UploadedObjectCache e) =>
      UploadedObject(
        id: e.id,
        owner: e.owner,
        stateBlock: decodeStateBlock(e.stateBlockJson),
        stateName: e.stateName,
        hashes: e.joinedHashes
            .split('\n')
            .map<HexEx>((final e) => HexEx(noPrefixValue: e))
            .toList(),
        // obj: e.obj,
        compressedWith: e.compressedWith,
        category: jsonDecode(e.categoryJson),
        whenApproved: e.whenApproved,
        whenCreated: e.whenCreated,
        propsRaw: decodeProps(e.propsJson),
      );

  static List<int> decodeStateBlock(final String stateBlock) {
    final ld = jsonDecode(stateBlock) as List<dynamic>;
    return ld.map<int>((final e) => e as int).toList();
  }

  static List<PropValueRaw> decodeProps(final String rawProps) {
    final ld = jsonDecode(rawProps) as List<dynamic>;
    return ld
        .map<PropValueRaw>(
          (final e) => PropValueRaw(
            propIdx: e['propIdx'],
            maxValue: e['maxValue'],
          ),
        )
        .toList();
  }

  factory UploadedObject.fromJson(
    final Map<String, dynamic> json,
    final DateTime cacheDate,
    final int id,
  ) {
    final state = json['state'] as Map<String, dynamic>;
    final dynamic stateValue = state.values.first;
    List<int> stateValueRes = [];

    if (stateValue is String) {
      stateValueRes = [stateValue.unsafeInt];
    } else if (stateValue is List<dynamic>) {
      final int1 = (stateValue.first as String).unsafeInt;
      final int2 = (stateValue.last as String).unsafeInt;
      stateValueRes = [int1, int2];
    } else {
      throw Exception('Unknown state block type');
    }

    final category = json['category'] as Map<String, dynamic>;

    final int whenCreated = (json['whenCreated'] as String).unsafeInt;
    int? whenApproved;
    if (json['whenApproved'] != null &&
        json['whenApproved'].toString().tryUnsafeInt != null) {
      whenApproved = (json['whenApproved'] as String).unsafeInt;
    }

    final props = (json['prop'] as List<dynamic>)
        .map<PropValueRaw>(
          (final dynamic e) => PropValueRaw(
            propIdx: e['propIdx'] as String,
            maxValue: e['maxValue'] as String,
          ),
        )
        .toList();

    final hashes = (json['hashes'] as List<dynamic>)
        .map<HexEx>((final dynamic e) =>
            HexEx(noPrefixValue: e.toString().substring(2)))
        .toList();

    return UploadedObject(
      id: id,
      stateName: state.keys.first,
      stateBlock: stateValueRes,
      compressedWith: json['compressedWith'] as String,
      category: category,
      whenCreated: whenCreated,
      whenApproved: whenApproved,
      owner: json['owner'] as String,
      propsRaw: props,
      hashes: hashes,
    );
  }
}

class ObjectContent {
  final int id;
  final String obj;

  const ObjectContent({
    required this.id,
    required this.obj,
  });
}

enum UploadedObjectStatus {
  approved,
  estimating,
  notApproved,
  unknown,
}

@JsonSerializable(explicitToJson: true)
class PropValueRaw {
  final String? propIdx;
  final String? maxValue;

  const PropValueRaw({
    this.propIdx,
    this.maxValue,
  });

  Map<String, dynamic> toJson() => _$PropValueRawToJson(this);
}

extension Getters on UploadedObject {
  UploadedObjectStatus get status {
    final comparable = stateName.toLowerCase();
    switch (comparable) {
      case 'approved':
        return UploadedObjectStatus.approved;
      case 'estimating':
        return UploadedObjectStatus.estimating;
      case 'notapproved':
        return UploadedObjectStatus.notApproved;
      default:
        return UploadedObjectStatus.unknown;
    }
  }

  DateTime? get statusDateUTC {
    try {
      return dateTimeFromBlockNumber(stateBlock.first);
    } on Object catch (e) {
      logger.e('UploadedObject statusDateUTC ' + e.toString() + ' $stateBlock');
      return null;
    }
  }

  bool get isFinished {
    return status == UploadedObjectStatus.approved ||
        status == UploadedObjectStatus.notApproved;
  }

  List<PropValue> get props => propsRaw.isEmpty
      ? []
      : propsRaw
          .map(
            (final e) => PropValue(
              propIdx: e.propIdx!.unsafeInt,
              maxValue: e.maxValue!.unsafeBigInt,
            ),
          )
          .toList();
}

extension _ on Object {
  int get unsafeInt => int.parse(this.toString().replaceAll(',', ''));
  int? get tryUnsafeInt => int.tryParse(this.toString().replaceAll(',', ''));
  BigInt get unsafeBigInt => BigInt.parse(this.toString().replaceAll(',', ''));
}
