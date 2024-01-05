import 'package:bloc/bloc.dart';
import 'package:threedpass/features/wallet_screen/add_contact_page/domain/entities/contact.dart';
import 'package:threedpass/features/wallet_screen/add_contact_page/domain/repositories/contacts_repository.dart';

part 'contacts_event.dart';

part 'contacts_state.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  ContactsBloc({
    required this.contactsRepository,
  }) : super(const ContactsState([])) {
    on<DeleteContact>(_deleteContact);
    on<AddContact>(_addContact);
    on<_LoadContacts>(_loadList);
  }

  final ContactsRepository contactsRepository;

  Future<void> init() async {
    final contacts = contactsRepository.getAll();
    add(_LoadContacts(contacts: contacts));
  }

  Future<void> _loadList(
    final _LoadContacts event,
    final Emitter<ContactsState> emit,
  ) async {
    emit(ContactsState(event.contacts));
  }

  Future<void> _deleteContact(
    final DeleteContact event,
    final Emitter<ContactsState> emit,
  ) async {
    await contactsRepository.deleteContact(event.contact);

    final list = state.contacts;
    list.removeWhere(
      (final element) => element == event.contact,
    );
    emit(ContactsState(list));
  }

  Future<void> _addContact(
    final AddContact event,
    final Emitter<ContactsState> emit,
  ) async {
    await contactsRepository.addContact(event.contact);
    final list = contactsRepository.getAll();
    emit(ContactsState(list));
  }

  bool isContactExisting(final Contact contact) {
    final bool isContactExisting =
        contactsRepository.isContactExisting(contact);
    return isContactExisting;
  }
}
