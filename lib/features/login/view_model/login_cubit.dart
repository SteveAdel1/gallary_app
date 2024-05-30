import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/api_manager/web_service.dart';
import '../../../core/failure/server_failure.dart';
import '../../../core/helpers/cache_helper.dart';
import '../../../data/data_source/login_data_source/login_data_source.dart';
import '../../../data/data_source/login_data_source_imp/data_source_imp.dart';
import '../../../data/repo_imp/login_repo_imp/login_repo_imp.dart';
import '../../../domain/repo/login_repo/login_repo.dart';
import '../../../domain/use_case/login_use_case/login_use_case.dart';
import 'login_states.dart';



class LoginCubit extends Cubit<LoginStates>{

  LoginCubit() : super(LoadingLoginState());
  WebServices _services = WebServices();
  late LoginDataSource loginDataSource;
  late LoginRepo loginRepository;
  late LoginUseCase loginUseCase;
  Future<bool> login(String email, String password) async {
    loginDataSource = LoginDataSourceImp(_services.freeDio);
    loginRepository = LoginRepoImp(loginDataSource);
    loginUseCase = LoginUseCase(loginRepository);
    final result = await loginUseCase.execute(email, password);

    return result.fold((fail) {
      var failure = fail as ServerFailure;
      return Future.value(false);
    }, (data) {
      return Future.value(true);
    });
  }



  // login(String email,String password) async {
  //  dynamic user =  await apiManager.login(email , password);
  //  if(user != null){
  //    CacheHelper.saveData(key: 'name', value: user.name);
  //    CacheHelper.saveData(key: 'email', value: user.email);
  //    CacheHelper.saveData(key: 'id', value: user.id);
  //    CacheHelper.saveData(key: 'token', value: user.token);
  //    emit(SuccessLoginState());
  //  }else{
  //    emit(ErrorLoginState());
  //  }
  // }
}