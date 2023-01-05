import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_app/src/domain/model/post-model.dart';
import 'package:test_app/src/data/repository/api/api-repository.dart';
part 'post-event.dart';
part 'post-state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    final ApiRepository _apiRepository = ApiRepository();

    on<GetPostList>((event, emit) async {
      try {
        emit(PostLoading());
        final mList = await _apiRepository.fetchCovidList();
        emit(PostLoaded(mList));
        if (mList.error != null) {
          emit(PostError(mList.error));
        }
      } on NetworkError {
        emit(const PostError("Failed to fetch data. is your device online?"));
      }
    });
  }
}
