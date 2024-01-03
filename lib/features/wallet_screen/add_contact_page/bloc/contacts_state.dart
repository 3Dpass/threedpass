part of 'contacts_bloc.dart';

abstract class ContactsState {
  const ContactsState();
}

class ContactsCurrentState extends ContactsState {
  final List<Contact> contacts;

  const ContactsCurrentState({required this.contacts});
}

class IsContactExistingLoaded extends ContactsState {
  final bool isContactExisting;
  final Contact newContact;

  const IsContactExistingLoaded({
    required this.isContactExisting,
    required this.newContact,
  });
}
