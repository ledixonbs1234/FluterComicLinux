import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/cubit/info/info_cubit.dart';
import 'package:flutter_app/cubit/read/read_cubit.dart';
import 'package:flutter_app/view/readview.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InfoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<InfoCubit, InfoState>(
      builder: (context, state) {
        if (state is InfoLoaded)
          return SingleChildScrollView(
              child: Column(
            children: [
              Stack(
                children: [
                  Container(
                      height: MediaQuery.of(context).size.height + 400,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Image.network(
                            state.comic.imagePath,
                            fit: BoxFit.fill,
                            height: MediaQuery.of(context).size.height / 3 * 2 +
                                100,
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Text(
                            "Chapter",
                            style: TextStyle(fontSize: 20, color: Colors.blue),
                          ),
                          Container(
                            height: 400,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.separated(
                              shrinkWrap: true,
                              primary: false,
                              itemCount: state.comic.chapters.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                    onTap: () {
                                      //Thuc hien chuyen sang trang tiep theo
                                      Navigator.push(context, MaterialPageRoute(builder: (_)=>ReadView()));
                                      context.bloc<ReadCubit>()..setUpView(state.comic.chapters[index].url);

                                    },
                                    child: ListTile(
                                        title: Container(
                                            child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(state.comic.chapters[index].name),
                                        Text(
                                          state.comic.chapters[index].date,
                                          style: TextStyle(
                                              color: Colors.black38,
                                              fontSize: 15),
                                        )
                                      ],
                                    ))));
                              },
                              separatorBuilder: (context, index) {
                                return Divider();
                              },
                            ),
                          ),
                        ],
                      )),
                  Positioned(
                    width: MediaQuery.of(context).size.width,
                    top: MediaQuery.of(context).size.height / 3,
                    height: MediaQuery.of(context).size.height / 3 + 100,
                    child: Container(
                        decoration:
                            BoxDecoration(color: Colors.black38, boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3))
                        ]),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(7),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.deepOrange, width: 1),
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(10))),
                                    child: Text(state.comic.tinhTrang,
                                        style:
                                            TextStyle(color: Colors.white70)),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(7),
                                    decoration: BoxDecoration(
                                        color: Colors.deepOrange,
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10))),
                                    child: Text(state.comic.luotXem,
                                        style:
                                            TextStyle(color: Colors.white70)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                state.comic.ten,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                                textAlign: TextAlign.start,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(state.comic.noiDung,
                                  style: TextStyle(color: Colors.white54))
                            ],
                          ),
                        )),
                  ),
                  Positioned(
                      top: MediaQuery.of(context).size.height / 3 * 2 + 70,
                      child: Container(
                        width: MediaQuery.of(context).size.width - 80,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        margin:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RaisedButton(
                                onPressed: () {}, child: Text('Doc Tu Dau')),
                            RaisedButton(
                                onPressed: () {}, child: Text('Moi Nhat'))
                          ],
                        ),
                      ))
                ],
              ),
              //Image.network(state.comic.imagePath,fit: BoxFit.fill),
            ],
          ));

        return Container(child: Center(child: Text("Loi khong load duoc")));
      },
    ));
  }
}
