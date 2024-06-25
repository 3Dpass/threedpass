import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/basic_pool_entity.dart';
import 'package:threedpass/features/asset_conversion/ui/create_pool/bloc/create_pool_cubit.dart';
import 'package:threedpass/features/asset_conversion/ui/create_pool/presentation/widgets/create_pool_asset_choice.dart';

class CreatePoolAssetField extends StatelessWidget {
  const CreatePoolAssetField({
    required this.assetNum,
    required this.buildWhen,
    required this.onChanged,
    super.key,
  });

  final String assetNum;
  final void Function(PoolAssetField?) onChanged;
  final bool Function(CreatePoolState, CreatePoolState)? buildWhen;

  @override
  Widget build(final BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('create_pool_asset_choice_title'.tr(args: [assetNum])),
        const SizedBoxH8(),
        BlocBuilder<CreatePoolCubit, CreatePoolState>(
          buildWhen: buildWhen,
          builder: (final context, final state) => CreatePoolAssetChoice(
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
