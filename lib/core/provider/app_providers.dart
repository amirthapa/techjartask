import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:techjartask/features/details/viewmodel/details_provider.dart';
import 'package:techjartask/features/home/viewmodel/home_provider.dart';

class AppProviders {
  /// Add all common providers here
  static final List<SingleChildWidget> _providerList = [
    ChangeNotifierProvider(create: (context) => HomeProvider()),
    ChangeNotifierProvider(create: (context) => DetailsProvider()),
  ];

  static List<SingleChildWidget> get getProviders {
    return _providerList;
  }
}
