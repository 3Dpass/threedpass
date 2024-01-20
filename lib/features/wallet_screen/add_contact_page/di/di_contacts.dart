import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';
import 'package:super_core/super_core.dart';
import 'package:threedpass/features/wallet_screen/add_contact_page/bloc/contacts_bloc.dart';
import 'package:threedpass/features/wallet_screen/add_contact_page/data/repositories/contacts_store.dart';
import 'package:threedpass/features/wallet_screen/add_contact_page/domain/entities/contacts_directory.dart';
import 'package:threedpass/features/wallet_screen/add_contact_page/domain/repositories/contacts_repository.dart';

class DIContacts extends DIModule {
  @override
  Future<void> setup(final GetIt getIt) async {
    final Directory supportDir = await getApplicationDocumentsDirectory();
    getIt.registerSingleton<ContactsDirectory>(
      ContactsDirectory(supportDir.path),
    );

    // Storages
    getIt.registerSingleton<ContactsStore>(
      ContactsStore(),
    );

    // open boxes
    await getIt<ContactsStore>().init();

    getIt.registerSingleton<ContactsRepository>(
      ContactsRepositoryImpl(
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
