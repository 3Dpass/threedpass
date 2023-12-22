part of 'contacts_bloc.dart';

abstract class ContactsState {
  const ContactsState();
}

class ContactsInitial extends ContactsState {}

class ContactsLoaded extends ContactsState {
  const ContactsLoaded({
    required this.contacts,
  });

  final List<Contact> contacts;
}
