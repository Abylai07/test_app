import 'package:test_app/src/presentation/bloc/post-bloc.dart';
import 'package:test_app/src/domain/model/post-model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MyButtonWithBloc extends StatefulWidget {
  const MyButtonWithBloc({Key? key}) : super(key: key);

  @override
  _MyButtonWithBlocState createState() => _MyButtonWithBlocState();
}

class _MyButtonWithBlocState extends State<MyButtonWithBloc> {
  final PostBloc _postBloc = PostBloc();
  List<Color> buttonColorList = const [Color(0xFF4D8EFF), Color(0xFFCDC1FF),Color(0xFF7AE582),Color(0xFF81CCF2),Color(0xFF77EDD9), ];


  @override
  void initState() {
    _postBloc.add(GetPostList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildListTitle(),
    );
  }

  Widget _buildListTitle() {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _postBloc,
        child: BlocListener<PostBloc, PostState>(
          listener: (context, state) {
            if (state is PostError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<PostBloc, PostState>(
            builder: (context, state) {
              if (state is PostInitial) {
                return _buildLoading();
              } else if (state is PostLoading) {
                return _buildLoading();
              } else if (state is PostLoaded) {
                return _buildCard(context, state.postModel);
              } else if (state is PostError) {
                return Container();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, PostModel model) {
    return ListView.builder(
        itemCount: buttonColorList.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                color: buttonColorList[index].withOpacity(0.3),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: ListTile(
                  title: Text("Country: ${model.post![index].name}".toUpperCase(), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                  leading: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: buttonColorList[index],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.qr_code, color: Colors.black),
                  ),
                ),
              ),
            ),
          );
        });
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());
}