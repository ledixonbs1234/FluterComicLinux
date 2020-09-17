import 'package:flutter/material.dart';
import 'package:flutter_app/main/main_cubit.dart';
import 'package:flutter_app/resposibility/MainResposibility.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'info/info_cubit.dart';

void main() {
  runApp(
      RepositoryProvider(
        create: (_) => MainResosibility(),
        child: BlocProvider(
          create: (BuildContext context) => MainCubit(context.repository<MainResosibility>()),
          child: MyApp(),
        ),
      )
      );
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
        body: BlocBuilder<MainCubit, MainState>(builder: (context, state) {
          final TextEditingController _controller = TextEditingController();
          if(state is MainInitial){
            _controller.text = state.defaultUrl;
           return Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(width: 200, child: TextField(controller: _controller,)),
              RaisedButton(onPressed: () {
                context.bloc<MainCubit>()..GetContentFromWeb(_controller.text);
              }, child: Text('Nhap'))
            ],
          ));
            }else
        return Text("Loi");}));
  }
}
