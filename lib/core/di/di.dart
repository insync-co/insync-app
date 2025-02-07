import 'package:insync_flutter/core/di/repository/repository_di.dart';
import 'package:insync_flutter/core/di/use_case/use_case_di.dart';
import 'package:insync_flutter/core/di/view_model/view_model_di.dart';
import 'package:provider/single_child_widget.dart';

class DependencyInjection {
  static List<SingleChildWidget> providers = [
    ...RepositoryDI.providers,
    ...UseCaseDI.providers,
    ...ViewModelDI.providers,
  ];
}
