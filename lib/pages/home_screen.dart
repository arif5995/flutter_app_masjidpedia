import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterappmasjidpedia/bloc/authtenticate_bloc.dart';
import 'package:flutterappmasjidpedia/bloc/data_task_bloc.dart';
import 'package:flutterappmasjidpedia/pages/add_screen.dart';
import 'package:flutterappmasjidpedia/pages/detail_screen.dart';
import 'package:flutterappmasjidpedia/pages/login_screen.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(AddScreen());
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          elevation: 0.0,
          title: Text('Task List'),
          actions: [
            GestureDetector(
              onTap: () {},
              child: Icon(Icons.refresh),
            ),
            GestureDetector(
              onTap: () {
                context.read<AuthtenticateBloc>().add(SignOutLoaded());
              },
              child: Icon(Icons.logout),
            ),
            SizedBox(width: 8),
          ],
        ),
        body: BlocBuilder<AuthtenticateBloc, AuthtenticateState>(
          builder: (context, state) {
            if (state is AuthtenticateLoaded) {
              return Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 1.0,
                              spreadRadius: 0.0,
                              offset: Offset(1.0, 1.0))
                        ],
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0))),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundImage: NetworkImage(state.user.photoURL!),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 8, top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Hi, ',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      state.user.displayName ?? "Tidak Ada Nama",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    )
                                  ],
                                ),
                                Text(
                                  state.user.email ?? "Tidak Ada Email",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10),
                                ),
                                SizedBox(
                                  height: 30,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30,),
                  BlocProvider(
                    create: (context) =>
                    DataTaskBloc()
                      ..add(DataTaskUser(uid: state.user.uid)),
                    child: BlocBuilder<DataTaskBloc, DataTaskState>(
                      builder: (context, state) {
                        if ( state is DataTaskLoad) {
                          return Container(
                            child: Center(child: Text(state.load)),
                          );
                        }
                        return Center(child: Text('Data Gak ADa'));
                      },
                    ),
                  )
                ],
              );
            }
            return Center(child: Text('Error Unknown'),);
          },
        ));
  }
}

class _dataTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocProvider(
        create: (context) =>
            DataTaskBloc()..add(DataTaskUser(uid: 'YUHIUHOIJIOJOI')),
        child: BlocBuilder<DataTaskBloc, DataTaskState>(
          builder: (context, state) {
            if (state is DataTaskLoad) {
              Text(state.load);
            }
            return Center(
              child: Text('gak ada data'),
            );
            // return ListView(
            //   shrinkWrap: true,
            //   scrollDirection: Axis.vertical,
            //   children: [
            //     Card(
            //       child: ListTile(
            //         subtitle: Text("Subtitle"),
            //         title: Text("title"),
            //         trailing: Icon(Icons.arrow_forward_ios),
            //         onTap: () {
            //           Get.to(DetailScreen());
            //         },
            //       ),
            //     )
            //   ],
            // );
          },
        ),
      ),
    );
  }
}
