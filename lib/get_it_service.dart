import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:save_up/features/home/data/repositories/transaction_repository_impl.dart';
import 'package:save_up/features/home/domain/usecases/get_grouped_transactions.dart';
import 'package:save_up/features/home/domain/usecases/get_transactions.dart';
import 'package:save_up/features/home/presentation/cubit/transaction/transaction_cubit.dart';
import 'package:save_up/features/scan/domain/usecases/process_image_usecase.dart';
import 'package:save_up/features/scan/domain/usecases/save_transactions_usecase.dart';
import 'package:save_up/features/scan/presentation/cubit/review/review_cubit.dart';
import 'package:save_up/features/scan/presentation/cubit/scan/scan_cubit.dart';
import 'features/home/domain/repositories/transaction_repository.dart';
import 'features/scan/data/repositories/scan_repository_impl.dart';
import 'features/scan/domain/entities/transaksi.dart';
import 'features/scan/domain/repositories/scan_repository.dart';

final serviceLocator = GetIt.instance;

void setup() {
  // Hive Box
  serviceLocator.registerSingleton<Box<Transaksi>>(
    Hive.box<Transaksi>('transaksiBox'),
  );

  // Repository
  serviceLocator.registerLazySingleton<TransactionRepository>(
    () => TransactionRepositoryImpl(serviceLocator()),
  );
  serviceLocator.registerLazySingleton<ScanRepository>(
    () => ScanRepositoryImpl(serviceLocator()),
  );

  // Use Cases
  serviceLocator.registerLazySingleton(() => GetTransactions(serviceLocator()));
  serviceLocator.registerLazySingleton(
    () => GetGroupedTransactions(serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => ProcessImageUsecase(serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => SaveTransactionsUsecase(serviceLocator()),
  );

  serviceLocator.registerFactory(
    () => TransactionCubit(getTransactions: serviceLocator(), getGroupedTransactions: serviceLocator()),
  );
  serviceLocator.registerFactory(() => ScanCubit(processImageUsecase: serviceLocator()));
  serviceLocator.registerFactory(() => ReviewCubit(transactionHiveBox: serviceLocator()));
}
