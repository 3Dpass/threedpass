part of 'transfer_info_bloc.dart';

extension FieldEvents on TransferInfoBloc {
  void _addFromAddress(
    final AddFromAddressEvent event,
    final Emitter<TransferInfoBlocState> emit,
  ) {
    final newFromAddresses = List<FromAddressData>.from(state.fromAddresses);
    newFromAddresses.add(
      FromAddressData(
        data: null,
        passwordController: TextEditingController(),
      ),
    );

    final newAmountsList = List<SendAmountData>.from(state.amounts);
    newAmountsList.add(
      SendAmountData(
        amountController: TextEditingController(),
      ),
    );

    emit(
      state.copyWith(
        fromAddresses: newFromAddresses,
        amounts: newAmountsList,
      ),
    );
  }

  void _addToAddress(
    final AddToAddressEvent event,
    final Emitter<TransferInfoBlocState> emit,
  ) {
    final newToAddresses = List<ToAddressData>.from(state.toAddresses);
    newToAddresses.add(
      ToAddressData(
        toAddressController: TextEditingController(),
      ),
    );

    final newAmountsList = List<SendAmountData>.from(state.amounts);
    newAmountsList.add(
      SendAmountData(
        amountController: TextEditingController(),
      ),
    );

    emit(
      state.copyWith(
        toAddresses: newToAddresses,
        amounts: newAmountsList,
      ),
    );
  }

  void _removeFromAddress(
    final RemoveFromAddressEvent event,
    final Emitter<TransferInfoBlocState> emit,
  ) {
    final newFromAddresses = List<FromAddressData>.from(state.fromAddresses);
    final index = newFromAddresses.indexOf(event.fromAddressData);
    newFromAddresses.remove(event.fromAddressData);

    final newAmounts = List<SendAmountData>.from(state.amounts);
    newAmounts.removeAt(index);

    emit(state.copyWith(fromAddresses: newFromAddresses, amounts: newAmounts));
  }

  void _removeToAddress(
    final RemoveToAddressEvent event,
    final Emitter<TransferInfoBlocState> emit,
  ) {
    final newToAddresses = List<ToAddressData>.from(state.toAddresses);
    final index = newToAddresses.indexOf(event.toAddressData);
    newToAddresses.remove(event.toAddressData);

    final newAmounts = List<SendAmountData>.from(state.amounts);
    newAmounts.removeAt(index);

    emit(state.copyWith(toAddresses: newToAddresses, amounts: newAmounts));
  }
}
