import 'package:auto_route/auto_route.dart';
import 'package:exercise/data/models/movie.dart';
import 'package:exercise/routes/routes.gr.dart';
import 'package:exercise/util/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../home/home_bloc/get_movies_bloc.dart';

class MovieList extends StatefulWidget {
  final int length;
  final List<Movie> movies;

  const MovieList({Key? key, required this.length, required this.movies})
      : super(key: key);

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  final ScrollController _controller = ScrollController(keepScrollOffset: true);
  int _offset = 0;

  void _getNewData() {
    _offset = _offset + 1;
    context.read<GetMovieBloc>().add(GetMovieList(10, _offset));
  }

  @override
  Widget build(BuildContext context) {
    return LazyLoadScrollView(
      onEndOfPage: () => _getNewData(),
      child: Scrollbar(
        child: ListView.builder(
          itemCount: widget.length,
          itemBuilder: ((context, index) {
            return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Stack(alignment: Alignment.bottomCenter, children: [
                    InkWell(
                      onTap: () => context.router
                          .push(Details(movie: widget.movies[index])),
                      child: Image.network(
                        widget.movies[index].img!,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 150,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.transparent, Colors.black])),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 130,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.movies[index].name!,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 22),
                            ),
                          ),
                          Text(
                            DateFormater.format(widget.movies[index].birthday!),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16),
                          ),
                        ],
                      ),
                    )
                  ]),
                ));
          }),
        ),
      ),
    );
  }
}
