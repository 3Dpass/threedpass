// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';

import 'package:threedpass/core/polkawallet/utils/datetime_from_block_number.dart';
import 'package:threedpass/core/utils/logger.dart';
import 'package:threedpass/features/app/data/cache_database.dart';
import 'package:threedpass/features/chains/domain/entities/hex_ex.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/prop_value.dart';

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
        stateBlock: jsonDecode(e.stateBlockJson),
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
        propsRaw: jsonDecode(e.propsJson),
      );

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
        .map<String>((final dynamic e) => e.toString())
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
      hashes: hashes
          .map((final e) => HexEx(noPrefixValue: e))
          .toList(), // TODO CHECK IF SUBSTRING CALL NEEDED
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

class PropValueRaw {
  final String? propIdx;
  final String? maxValue;

  const PropValueRaw({
    this.propIdx,
    this.maxValue,
  });
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
