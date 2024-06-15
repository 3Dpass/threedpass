import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';
import 'package:threedpass/core/widgets/buttons/secondary_button.dart';
import 'package:threedpass/core/widgets/d3p_card.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/pool_full_info.dart';
import 'package:threedpass/features/poscan_assets/bloc/poscan_assets_cubit.dart';

class PoolCard extends StatelessWidget {
  const PoolCard(this.poolFullInfo, {super.key});

  final PoolFullInfo poolFullInfo;

  @override
  Widget build(BuildContext context) {
    return D3pCard(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  // WidgetSpan(
                  //   child: _IconsRow(),
                  // ),
                  // WidgetSpan(
                  //   child: SizedBox(width: 8),
                  // ),
                  TextSpan(
                    text:
                        '${poolFullInfo.asset1Meta?.symbol ?? 'P3D'} - ${poolFullInfo.asset2Meta?.symbol ?? 'P3D'}',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
              maxLines: 2,
            ),
            SizedBoxH16(),
            Text(
              'Total locked coins',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.grey,
                  ),
            ),
            SizedBoxH8(),
            _LockedCoin(),
            _LockedCoin(),
            SizedBoxH8(),
            _LPTokens(),
            SizedBoxH16(),
            D3pElevatedButton(
              text: 'Deposit',
              onPressed: () {},
            ),
            SizedBoxH8(),
            D3pSecondaryButton(
              localizedTextKey: 'Withdraw',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _IconsRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      width: 44,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: 24,
              width: 24,
              color: Colors.red,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: 24,
              width: 24,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}

class _LockedCoin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 12,
          width: 12,
          color: Colors.blue,
        ),
        SizedBox(width: 8),
        Text(
          '0.009509085784',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}

class _LPTokens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'LP Tokens: ',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.grey,
                ),
          ),
          TextSpan(
            text: '0',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
