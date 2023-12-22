part of 'contacts_bloc.dart';

abstract class ContactsEvent {
  const ContactsEvent();
}

class DeleteContact extends ContactsEvent {
  const DeleteContact({
    required this.contact,
  });

  final Contact contact;
}

class AddContact extends ContactsEvent {
  const AddContact({
    required this.contact,
  });

  final Contact contact;
}

class _LoadContacts extends ContactsEvent {
  const _LoadContacts({
    required this.contacts,
  });

  final List<Contact> contacts;
}
