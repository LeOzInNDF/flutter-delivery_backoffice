import 'package:flutter_modular/flutter_modular.dart';

import '../../repositories/payment_type/payment_type_repository.dart';
import '../../repositories/payment_type/payment_type_repository_impl.dart';
import 'payment_type_controller.dart';
import 'payment_type_page.dart';

class PaymentTypeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => PaymentTypeController(i())),
        Bind.lazySingleton<PaymentTypeRepository>(
          (i) => PaymentTypeRepositoryImpl(i()),
        )
      ];

  @override
  List<ModularRoute> get routes =>
      [ChildRoute('/', child: (context, args) => const PaymentTypePage())];
}
