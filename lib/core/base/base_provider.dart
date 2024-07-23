import 'package:flutter/material.dart';

abstract class BaseProvider extends ChangeNotifier {
  bool _loading = false;

  void setLoaderState(bool loaderState) {
    _loading = loaderState;
  }

  bool get isLoading => _loading;
}
