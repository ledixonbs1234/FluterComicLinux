import 'package:flutter/material.dart';
import 'package:flutter_app/cubit/read/read_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReadView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: BlocBuilder<ReadCubit,ReadState>(builder: (context,state){
        if (state is ReadLoaded) {
          return ListView.builder(
              itemCount: state.pages.length,
              itemBuilder: (context, index) {
            return ListTile(
              contentPadding: EdgeInsets.zero,

              title: Image.network(state.pages[index].url),
            );
          });
        }
        return Center(child:Text('Loi'));
      }),
    );
  }
}
