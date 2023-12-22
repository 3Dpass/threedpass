import 'package:bloc/bloc.dart';
import 'package:threedpass/features/wallet_screen/add_contact_page/domain/entities/contact.dart';
import 'package:threedpass/features/wallet_screen/add_contact_page/domain/repositories/contacts_repository.dart';

part 'contacts_event.dart';

part 'contacts_state.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  ContactsBloc({
    required this.contactsRepository,
  }) : super(ContactsInitial()) {
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
    emit(ContactsLoaded(contacts: event.contacts));
  }

  Future<void> _deleteContact(
    final DeleteContact event,
    final Emitter<ContactsState> emit,
  ) async {
    await contactsRepository.deleteContact(event.contact);

    if (state is ContactsLoaded) {
      final list = (state as ContactsLoaded).contacts;
      list.removeWhere(
        (final element) => element == event.contact,
      );
      emit(ContactsLoaded(contacts: list));
    }
  }

  Future<void> _addContact(
    final AddContact event,
    final Emitter<ContactsState> emit,
  ) async {
    await contactsRepository.addContact(event.contact);
    if (state is ContactsLoaded) {
      final list = (state as ContactsLoaded).contacts;
      list.add(event.contact);
      emit(ContactsLoaded(contacts: list));
    }
  }
}
