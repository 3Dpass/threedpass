import 'package:threedpass/core/persistence/hive_universal_store.dart';
import 'package:threedpass/features/wallet_screen/add_contact_page/domain/entities/contact.dart';

class ContactsStore extends HiveUniversalStore<Contact> {
  ContactsStore() : super(boxName: 'contacts');
}
