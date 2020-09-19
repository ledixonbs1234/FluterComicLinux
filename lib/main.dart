import 'package:flutter/material.dart';
import 'package:flutter_app/cubit/read/read_cubit.dart';
import 'package:flutter_app/resposibility/readreposibility.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/info/info_cubit.dart';
import 'cubit/main/main_cubit.dart';
import 'resposibility/mainreposibility.dart';
import 'view/infoview.dart';

void main() {
  runApp(MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => ReadResposibility()),
        RepositoryProvider(create: (_) => MainResosibility())
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) =>
                MainCubit(context.repository<MainResosibility>()),
          ),
          BlocProvider(
            create: (BuildContext context) =>
                ReadCubit(context.repository<ReadResposibility>()),
          ),
          BlocProvider(create: (BuildContext context) => InfoCubit())
        ],
        child: MyApp(),
      )));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Flutter App")),
        body: BlocConsumer<MainCubit, MainState>(listener: (context, state) {
          if (state is MainLoaded) {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => InfoView()));
            context.bloc<InfoCubit>().setUpInfo(state.comic);
          }
        }, builder: (context, state) {
          final TextEditingController _controller = TextEditingController();
          if (state is MainInitial) {
            _controller.text = state.defaultUrl;
            return Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    width: 200,
                    child: TextField(
                      controller: _controller,
                    )),
                RaisedButton(
                    onPressed: () {
                      context.bloc<MainCubit>()
                        ..getContentFromWeb(_controller.text);
                    },
                    child: Text('Nhap'))
              ],
            ));
          }

          if (state is MainLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return Text("Loi");
        }));
  }
}
