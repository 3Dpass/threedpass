import 'package:isar/isar.dart';
import 'package:threedpass/core/polkawallet/utils/log.dart';

part 'uploaded_object.g.dart';

// @HiveType(typeId: 9)
@collection
class UploadedObject {
  final String stateName; // Approved: 565,330
  final List<int> stateBlock;

  final String obj;
  final String compressedWith;
  final String categoryExternal;
  final String categoryInternal;
  final List<String> hashes;
  final int whenCreated;
  final int? whenApproved;
  final String owner;
  final List<PropValueRaw> propsRaw;

  // final Map<dynamic, dynamic> raw;
  final Id id;
  final DateTime cacheDate;

  const UploadedObject({
    required this.id,
    required this.stateName,
    required this.stateBlock,
    required this.obj,
    required this.compressedWith,
    required this.categoryExternal,
    required this.categoryInternal,
    required this.hashes,
    required this.whenCreated,
    required this.whenApproved,
    required this.owner,
    required this.propsRaw,
    required this.cacheDate,
  });

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
      obj: json['obj'] as String,
      compressedWith: json['compressedWith'] as String,
      categoryExternal: category.keys.first,
      categoryInternal: category.values.first as String,
      hashes: hashes,
      whenCreated: whenCreated,
      whenApproved: whenApproved,
      owner: json['owner'] as String,
      propsRaw: props,
      cacheDate: cacheDate,
    );
  }

  // PropValue get propValue => props[0].propValue;

  // String get owner => raw['owner'] as String;

  // List<String> get hashes => (raw['hashes'] as List<dynamic>)
  //     .map((final dynamic e) => e.toString().substring(2))
  //     .toList();

  // String get statusRaw => (raw['state'] as Map).keys.first.toString();

  // List<PropValue> get props {
  //   try {
  //     final list = raw['prop'] as List<dynamic>;

  //     final res = list.map(
  //       (final dynamic e) {
  //         e as Map<dynamic, dynamic>;
  //         final typed = e.map<String, dynamic>(
  //           (final dynamic key, final dynamic value) =>
  //               MapEntry<String, dynamic>(key.toString(), value),
  //         );
  //         return PropValue.fromJson(typed);
  //       },
  //     ).toList();
  //     return res;
  //   } on Object catch (e) {
  //     logE(e.toString() + ' ' + raw['prop'].toString());
  //     return [];
  //   }
  // }
}

enum UploadedObjectStatus {
  approved,
  estimating,
  notApproved,
  unknown,
}

@embedded
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
      final initialDate = DateTime(2022, DateTime.august, 30, 21, 36);
      final realStatus = initialDate.add(Duration(minutes: stateBlock.first));

      return realStatus;
    } on Object catch (e) {
      logE('UploadedObject statusDateUTC ' + e.toString() + ' $stateBlock',
          StackTrace.current);
      return null;
    }
  }

  bool get isFinished {
    return status == UploadedObjectStatus.approved ||
        status == UploadedObjectStatus.notApproved;
  }
}

extension _ on Object {
  int get unsafeInt => int.parse(this.toString().replaceAll(',', ''));
  int? get tryUnsafeInt => int.tryParse(this.toString().replaceAll(',', ''));
}
