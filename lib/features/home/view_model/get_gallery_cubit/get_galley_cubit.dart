import 'package:app/data/data_source/gellary_data_source_imp/galley_data_source_imp.dart';
import 'package:app/features/home/view_model/get_gallery_cubit/git_gallery_states.dart';
import 'package:app/features/login/view_model/login_states.dart';
import 'package:bloc/bloc.dart';
import '../../../../core/api_manager/web_service.dart';
import '../../../../core/failure/server_failure.dart';
import '../../../../data/data_source/gellary_data_source/gellary_data_source.dart';
import '../../../../data/repo_imp/gallery_repo_imp/gallery_repo_imp.dart';
import '../../../../domain/repo/gallery_repo/gallery_repo.dart';
import '../../../../domain/use_case/gallery_use_case/gallery_use_case.dart';

class GalleryCubit extends Cubit<GalleryStates> {
  GalleryCubit() : super(LoadingGalleryState());

  final WebServices _services = WebServices();
  late GalleryDataSource galleryDataSource;
  late GalleryRepo galleryRepo;
  late GalleryUseCase galleryUseCase;

  Future<bool> getGalleryList() async {
    emit(LoadingGalleryState());

    galleryDataSource = GalleryDataSourceImp(_services.freeDio);
    galleryRepo = GalleryRepoImp(galleryDataSource);
    galleryUseCase = GalleryUseCase(galleryRepo);
    var result = await galleryUseCase.execute();
    return result.fold((fail) {
      var error = fail as ServerFailure;
      emit(ErrorGalleryState());
      return Future.value(false);
    }, (data) {
      emit(SuccessGalleryState(data));
      return Future.value(true);
    });
  }
}
