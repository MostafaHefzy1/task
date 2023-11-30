import '../../core/handling_flutter_imports/handling_flutter_imports_screen.dart';

class AuthCubit extends Cubit<AuthState> {
  static AuthCubit get(context) => BlocProvider.of(context);
  AuthCubit() : super(AuthInitial());
  IconData suffix = Icons.visibility_off;
  bool isShow = true;
  
  void isShowAndHidePassWord() {
    isShow = !isShow;
    suffix = isShow ? Icons.visibility_off : Icons.remove_red_eye;
    emit(ShowAndHidePasswordState());
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  void registerUsingFirebase({
    required String name,
    required String email,
    required String password,
  }) {
    emit(RegisterLoadingState());
    _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((user) {
      createUserInFireStore(
        name: name,
        email: email,
        uid: user.user!.uid,
      );
      emit(RegisterSuccessState(user));
    }).catchError((error) {
      emit(RegisterFailedState());
    });
  }

  void createUserInFireStore({
    required String name,
    required String email,
    required String uid,
  }) {
    UserModel userModel = UserModel(
      email: email,
      userId: uid,
      name: name,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set(userModel.toMap())
        .then((value) {
      emit(CreateUserSuccessState());
    }).catchError((error) {
      emit(CreateUserFailedState());
    });
  }

  void loginUsingFirebase({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((user) {
      emit(LoginSuccessState(user));
    }).catchError((error) {
      emit(LoginFailedState());
    });
  }
}
