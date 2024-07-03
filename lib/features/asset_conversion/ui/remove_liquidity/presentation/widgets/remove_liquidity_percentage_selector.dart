import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/buttons/secondary_button.dart';

class RemoveLiquidityPercentageSelector extends StatelessWidget {
  const RemoveLiquidityPercentageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OutlinedButton(onPressed: () {}, child: Text('25%')),
        OutlinedButton(onPressed: () {}, child: Text('50%')),
        ElevatedButton(onPressed: () {}, child: Text('75%')),
        OutlinedButton(onPressed: () {}, child: Text('75%')),
        OutlinedButton(onPressed: () {}, child: Text('max')),
      ],
    );
  }
}
