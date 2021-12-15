
import 'package:best_architecture_challenge/src/bloc/post_cubit.dart';
import 'package:best_architecture_challenge/src/model/post.dart';
import 'package:best_architecture_challenge/src/provider/rest_provider.dart';
import 'package:best_architecture_challenge/src/repository/repository.dart';
import 'package:best_architecture_challenge/src/ui/custom_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum SortOptions { id, title }
void main() {
  Repository repository = new RepositoryImp((RestProvider()));
  PostCubit postCubit = new PostCubit(repository);

  runApp(BlocProvider<PostCubit>(create: (_) => postCubit, child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyApp',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: PostPage(title: 'test_architecture'),
    );
  }
}

class PostPage extends StatelessWidget {
  PostPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[IconButton(icon: Icon(Icons.update), onPressed: (){
          context.read<PostCubit>().fetchData();
          }),
          PopupMenuButton<SortOptions>(
              icon: Icon(Icons.more_vert),
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Text('Ordenar por id'),
                      value: SortOptions.id,
                    ),
                    PopupMenuItem(
                      child: Text('Ordenar por title'),
                      value: SortOptions.title,
                    )
                  ],
              onSelected: context.read<PostCubit>().sort)
        ],
      ),
      body: BlocBuilder<PostCubit, PostState>(builder: (_, state) {
        if (state is PostReady) {
          return ListView.separated(
            padding: EdgeInsets.only(top: 15, bottom: 15),
            itemCount: state.postList.length,
            itemBuilder: (context, index) {
              Post itemPost = state.postList[index];

              return CustomCard(itemPost.id, itemPost.title, itemPost.body);
            },
            separatorBuilder: (context, index) {
              return Container(
                height: 35, /* color: Colors.grey.withOpacity(0.1), */
              );
            },
          );
        }
        return Center(child: CircularProgressIndicator());
      }),
    );
  }
}
