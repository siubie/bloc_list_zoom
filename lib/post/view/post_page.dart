import 'package:bloc_list_zoom/post/bloc/post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlocBuilder<PostBloc, PostState>(
              builder: (context, state) {
                //if state is post initial
                if (state is PostInitial) {
                  return const Text('Press the button to load post');
                }
                //if state is post loading add progress indicator with text that says loading
                if (state is PostLoading) {
                  return Column(
                    children: [
                      const CircularProgressIndicator(),
                      Text(state.message),
                    ],
                  );
                }

                //if state is post loaded
                if (state is PostLoaded) {
                  //return a list view
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.posts.length,
                    itemBuilder: (context, index) {
                      //return a list tile
                      return ListTile(
                        title: Text(state.posts[index].title),
                        subtitle: Text(state.posts[index].body),
                      );
                    },
                  );
                }
                //if state is post error
                if (state is PostError) {
                  return const Text('Failed to load post');
                }
                return Container();
              },
            ),
            //add button to load post
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  //add event to fetch post
                  context.read<PostBloc>().add(FetchPost());
                },
                child: const Text('Load Post'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
