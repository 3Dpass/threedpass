import 'package:threedpass/features/wallet_screen/add_contact_page/data/repositories/contacts_store.dart';
import 'package:threedpass/features/wallet_screen/add_contact_page/domain/entities/contact.dart';

abstract class ContactsRepository {
  List<Contact> getAll();

  Future<void> addContact(final Contact contact);

  Future<void> deleteContact(final Contact contact);
}

class ContactsRepositoryImpl implements ContactsRepository {
  const ContactsRepositoryImpl({
    required this.contactsStore,
  });

  final ContactsStore contactsStore;

  @override
  Future<void> deleteContact(final Contact contact) async {
    await contactsStore.removeObject(contact);
  }

  @override
  List<Contact> getAll() {
    return contactsStore.getAll().toList();
  }

  @override
  Future<void> addContact(final Contact contact) async {
    await contactsStore.addObject(contact);
  }
}
