import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:save_up/features/chat/domain/usecases/retrive_chat_response.dart';
import 'package:save_up/features/home/data/repositories/transaction_repository_impl.dart';
import 'package:save_up/features/home/domain/usecases/add_transaction.dart';
import 'package:save_up/features/home/domain/usecases/get_grouped_transactions.dart';
import 'package:save_up/features/home/domain/usecases/get_transactions.dart';
import 'package:save_up/features/home/presentation/cubit/add_transaction/add_transaction_cubit.dart';
import 'package:save_up/features/home/presentation/cubit/transaction/transaction_cubit.dart';
import 'package:save_up/features/scan/domain/usecases/process_image_usecase.dart';
import 'package:save_up/features/scan/domain/usecases/save_transactions_usecase.dart';
import 'package:save_up/features/scan/presentation/cubit/review/review_cubit.dart';
import 'package:save_up/features/scan/presentation/cubit/scan/scan_cubit.dart';
import 'features/chat/data/repository/chat_repository_impl.dart';
import 'features/chat/domain/repository/chat_repository.dart';
import 'features/chat/presentation/cubit/chat_cubit.dart';
import 'features/home/domain/repositories/transaction_repository.dart';
import 'features/scan/data/repositories/scan_repository_impl.dart';
import 'features/scan/domain/entities/transaksi.dart';
import 'features/scan/domain/repositories/scan_repository.dart';

final serviceLocator = GetIt.instance;

void start() {
  // Hive Box
  serviceLocator.registerSingleton<Box<Transaksi>>(
    Hive.box<Transaksi>('transaksiBox2'),
  );

  // Repository
  serviceLocator.registerLazySingleton<TransactionRepository>(
    () => TransactionRepositoryImpl(hiveBox: serviceLocator()),
  );
  serviceLocator.registerLazySingleton<ScanRepository>(
    () => ScanRepositoryImpl(serviceLocator()),
  );

  // Use Cases
  serviceLocator.registerLazySingleton(
    () => FetchTransactions(serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => FetchGroupedTransactions(serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => GeminiProcessImage(serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => SaveTransactionsList(repository: serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => AddTransaction(repository: serviceLocator()),
  );

  serviceLocator.registerLazySingleton<ChatRepository>(
    () => ChatRepositoryImpl(),
  );

  // Use Cases
  serviceLocator.registerLazySingleton(
    () => RetriveChatResponse(repository: serviceLocator()),
  );

  // Cubit
  serviceLocator.registerFactory(
    () => ChatCubit(
      getChatResponse: serviceLocator(),
      addTransactionCubit: serviceLocator(),
    ),
  );

  // Cubit
  serviceLocator.registerFactory(
    () => TransactionCubit(
      getTransactions: serviceLocator(),
      getGroupedTransactions: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => ScanCubit(processImageUsecase: serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => ReviewCubit(transactionHiveBox: serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => AddTransactionCubit(addTransactionUsecase: serviceLocator()),
  );
}
