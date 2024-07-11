import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/basic_pool_entity.dart';
import 'package:threedpass/features/asset_conversion/ui/widgets/pool_asset_choice.dart';

class StatefulPoolAssetChoice<T extends StateStreamable<E>, E>
    extends StatelessWidget {
  const StatefulPoolAssetChoice({
    required this.assetNum,
    required this.buildWhen,
    required this.onChanged,
    this.initialValue,
    super.key,
  });

  final String assetNum;
  final void Function(PoolAssetField?)? onChanged;
  final bool Function(E, E)? buildWhen;
  final PoolAssetField? initialValue;

  @override
  Widget build(final BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('create_pool_asset_choice_title'.tr(args: [assetNum])),
        const SizedBoxH8(),
        BlocBuilder<T, E>(
          buildWhen: buildWhen,
          builder: (final context, final state) => PoolAssetFieldChoice(
            onChanged: onChanged,
            initialValue: initialValue,
          ),
        ),
      ],
    );
  }
}
