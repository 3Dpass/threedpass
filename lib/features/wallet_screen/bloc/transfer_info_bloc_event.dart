part of 'transfer_info_bloc.dart';

abstract class TransferInfoBlocEvent {
  const TransferInfoBlocEvent();
}

class UpdateTransferTypeEvent extends TransferInfoBlocEvent {
  final BalanceTransactionType value;

  const UpdateTransferTypeEvent(this.value);
}

class AddFromAddressEvent extends TransferInfoBlocEvent {
  const AddFromAddressEvent();
}

class RemoveFromAddressEvent extends TransferInfoBlocEvent {
  final FromAddressData fromAddressData;
  const RemoveFromAddressEvent(this.fromAddressData);
}

class AddToAddressEvent extends TransferInfoBlocEvent {
  const AddToAddressEvent();
}

class RemoveToAddressEvent extends TransferInfoBlocEvent {
  final ToAddressData toAddressData;
  const RemoveToAddressEvent(this.toAddressData);
}

class ChangeChosenAccountEvent extends TransferInfoBlocEvent {
  final FromAddressData dataToChange;
  final KeyPairData? acc;

  const ChangeChosenAccountEvent({
    required this.acc,
    required this.dataToChange,
  });
}

class SetBalanceAmountEvent extends TransferInfoBlocEvent {
  final FromAddressData fromAddressData;

  const SetBalanceAmountEvent(this.fromAddressData);
}

class CopyPasswordEvent extends TransferInfoBlocEvent {
  final FromAddressData fromAddressData;
  const CopyPasswordEvent(this.fromAddressData);
}
