import 'package:finder/presentation/base/base_view_model.dart';

class RegisterViewModel extends BaseViewModel with RegisterViewModelInput,RegisterViewModelOutput {
  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void start() {
    // TODO: implement start
  }

  @override
  void camera() {
    // TODO: implement camera
  }

  @override
  void login() {
    // TODO: implement login
  }

  @override
  void register() {
    // TODO: implement register
  }
}




//on boarding function input
abstract class RegisterViewModelInput {
  void camera(); // open gallery and upload photo
  void login();  //navigate to login screen
  void register(); // post and storage data, and register
}
//on boarding function output
abstract class RegisterViewModelOutput {}
