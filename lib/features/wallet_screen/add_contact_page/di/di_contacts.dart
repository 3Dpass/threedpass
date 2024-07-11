import 'package:get_it/get_it.dart';
import 'package:super_core/super_core.dart';
import 'package:threedpass/features/wallet_screen/add_contact_page/bloc/contacts_bloc.dart';
import 'package:threedpass/features/wallet_screen/add_contact_page/data/repositories/contacts_store.dart';
import 'package:threedpass/features/wallet_screen/add_contact_page/domain/repositories/contacts_repository.dart';

class DIContacts extends DIModule {
  @override
  Future<void> setup(final GetIt getIt) async {
    // Storages
    getIt.registerSingleton<ContactsStore>(
      ContactsStore(),
    );

    // open boxes
    await getIt<ContactsStore>().init();

    getIt.registerLazySingleton<ContactsRepository>(
      () => ContactsRepositoryImpl(
        contactsStore: getIt<ContactsStore>(),
      ),
    );

    getIt.registerFactory<ContactsBloc>(
      () => ContactsBloc(
        contactsRepository: getIt<ContactsRepository>(),
      )..init(),
    );
  }
}
