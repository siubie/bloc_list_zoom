part of 'post_bloc.dart';

sealed class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

//post initial state
final class PostInitial extends PostState {}

//add state for post loading
final class PostLoading extends PostState {
  final String message;

  const PostLoading({required this.message});

  @override
  List<Object> get props => [message];
}

//add state for post loaded
final class PostLoaded extends PostState {
  final List<Post> posts;

  const PostLoaded({required this.posts});
  //override get props
  @override
  List<Object> get props => [posts];
}

//add state for post error
final class PostError extends PostState {
  final String message;

  const PostError({required this.message});

  @override
  List<Object> get props => [message];
}
