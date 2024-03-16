import 'package:easy_localization/easy_localization.dart';
import 'package:threedpass/features/poscan_putobject/utils/max_value_validation_strategy.dart';

class MultipleOfTenPropertyValidator implements MaxValueValidationStrategy {
  @override
  String? isValid(final String input) {
    if (input.isEmpty) {
      return 'textfield_not_empty'.tr();
    }
    final number = int.tryParse(input);
    if (number != null) {
      if (number % 10 != 0) {
        return 'max_value_multiplier'.tr();
      } else if (number > 100000000) {
        return 'input_exceeds_limit'.tr();
      }
      return null;
    } else {
      return 'input_not_a_number'.tr();
    }
  }
}
