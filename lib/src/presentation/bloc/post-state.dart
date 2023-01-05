part of 'post-bloc.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object?> get props => [];
}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostLoaded extends PostState {
  final PostModel postModel;
  const PostLoaded(this.postModel);
}

class PostError extends PostState {
  final String? message;
  const PostError(this.message);
}
