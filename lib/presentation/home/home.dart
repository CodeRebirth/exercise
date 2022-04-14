import 'dart:async';
import 'package:exercise/presentation/home/home_bloc/get_movies_bloc.dart';
import 'package:exercise/presentation/widgets/movie_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../../data/models/movie.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Completer<GoogleMapController> _controller = Completer();
  int _offset = 0;
  bool loading = false;

  List<Movie> listOne = [];

  @override
  void initState() {
    super.initState();
    context.read<GetMovieBloc>().add(GetMovieList(10, 0));

    listOne = context.read<GetMovieBloc>().movieList;
  }

  void _getMoreData() async {
    _offset = _offset + 1;
    context.read<GetMovieBloc>().add(LazyLoad(10, _offset));
   
    final List<Movie> list = context.read<GetMovieBloc>().movieList;
    listOne.addAll(list);
    
    
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
              title: const Text("Task"),
              backgroundColor: Colors.green,
              bottom: const TabBar(
                indicatorWeight: 1,
                indicatorColor: Colors.green,
                tabs: [
                  Tab(
                    icon: Icon(Icons.image),
                    text: "Exercise 1",
                  ),
                  Tab(
                    icon: Icon(Icons.image),
                    text: "Exercise 2",
                  )
                ],
              )),
          body: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: BlocBuilder<GetMovieBloc, GetMoviesBlocState>(
                      builder: (ctx, state) {
                    if (state is MovieFetch) {
                      return Column(
                        children: [
                          Expanded(
                            child: LazyLoadScrollView(
                              onEndOfPage: _getMoreData,
                              child:
                                  MovieList(length: listOne.length, movies: listOne),
                            ),
                          ),
                        ],
                      );
                    }
                    if (state is Waiting) {
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    }
                    return const CircularProgressIndicator.adaptive();
                  }),
                ),
                SizedBox(
                  child: GoogleMap(
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                    scrollGesturesEnabled: true,
                    onMapCreated: (GoogleMapController controller) {
                      if (!_controller.isCompleted) {
                        _controller.complete(controller);
                      } else {}
                    },
                    markers: <Marker>{
                      const Marker(
                        markerId: MarkerId("1"),
                        position: LatLng(12.962938, 77.632852),
                      ),
                      const Marker(
                          markerId: MarkerId("2"),
                          position: LatLng(12.968165, 77.631801)),
                      const Marker(
                          markerId: MarkerId("3"),
                          position: LatLng(12.964897, 77.633897)),
                      const Marker(
                          markerId: MarkerId("4"),
                          position: LatLng(12.966897, 77.633897)),
                    },
                    initialCameraPosition: const CameraPosition(
                        target: LatLng(12.961348353994076, 77.63913941284328),
                        zoom: 14.0,
                        bearing: 0),
                  ),
                ),
              ])),
    );
  }
}
