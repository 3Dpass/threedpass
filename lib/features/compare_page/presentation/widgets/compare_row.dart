import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/utils/cut_string.dart';
import 'package:threedpass/core/widgets/text/d3p_body_large_text.dart';
import 'package:threedpass/features/compare_page/bloc/compare_cubit.dart';
import 'package:threedpass/features/compare_page/presentation/widgets/choose_list.dart';

part 'orig_obj_title.dart';

class CompareRow extends StatelessWidget {
  const CompareRow({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
          flex: 2,
          child: SizedBox(
            width: double.infinity,
            child: _OrigObjectTitle(),
          ),
        ),
        Flexible(
          child: SizedBox(
            width: double.infinity,
            child: D3pBodyLargeText(
              'VS',
              textAlign: TextAlign.center,
              translate: false,
            ),
          ),
        ),
        Flexible(
          flex: 2,
          child: SizedBox(
            width: double.infinity,
            child: ChooseList(),
          ),
        ),
      ],
    );
  }
}
