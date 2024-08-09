part of 'post_bloc.dart';

sealed class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

//add event for post fetch
final class FetchPost extends PostEvent {}
