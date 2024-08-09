import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../model/post.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    //ketika ada event fetch post logic nya apa ?
    //input adalah event
    on<FetchPost>((event, emit) async {
      //harus return state
      //kita bisa tambahkan busines logic disini
      //emit post loading
      emit(const PostLoading(message: 'Custom Message Loading'));
      //await for two second
      await Future.delayed(
        const Duration(seconds: 2),
      );
      emit(PostLoaded(posts: Post.generatePosts()));
    });
  }
}
