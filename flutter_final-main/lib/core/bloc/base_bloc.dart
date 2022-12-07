import 'package:flutter/widgets.dart';
import 'package:trabalho_pdm/core/service/dialog_service.dart';
import 'package:trabalho_pdm/locator.dart';

class BaseBloc with ChangeNotifier {
  var state;
  var isLoading = false;
  var dialogService = locator<DialogService>();

  BaseBloc({this.isLoading = false, this.state});

  initState(_initialState) {
    state = _initialState;
  }

  refresh() {
    notifyListeners();
  }

  changeState(_state) {
    this.state = _state;
    notifyListeners();
  }

  setLoading(_isLoading) {
    if (this.isLoading != _isLoading) {
      this.isLoading = _isLoading;
    }
    notifyListeners();
  }

  isNullOrEmpty(String? val) {
    return val == null || val.length == 0;
  }
}
