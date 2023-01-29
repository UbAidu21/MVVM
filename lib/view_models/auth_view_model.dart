import 'package:flutter/cupertino.dart';
import 'package:mvvm/repository/auth_repository/auth_repository.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';

///Actually this is A Provider or we can say that with the help of { view_model } we manage the State of the application
class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setSignUpLoading(bool value) {
    _signUpLoading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.loginApi(data).then(
      (value) {
        print(value.toString());
        Utils.flashBarErrorMessage('Success', value.toString(), context);
        Navigator.pushNamed(context, RoutesName.home);
        setLoading(false);
      },
    ).onError(
      (error, stackTrace) {
        Utils.flashBarErrorMessage(
          'Error!!',
          error.toString(),
          context,
        );
        setLoading(false);
      },
    );
  }

  Future<void> signUpApi(dynamic data, BuildContext context) async {
    setSignUpLoading(true);
    _myRepo.signUpApi(data).then(
      (value) {
        print(value.toString());
        Utils.flashBarErrorMessage(
            'Sign Up Successfully', value.toString(), context);
        Navigator.pushNamed(context, RoutesName.home);
        setSignUpLoading(false);
      },
    ).onError(
      (error, stackTrace) {
        Utils.flashBarErrorMessage(
          'Error!!',
          error.toString(),
          context,
        );
        setSignUpLoading(false);
      },
    );
  }
}
