import 'package:auto_route/auto_route.dart';
import 'package:exercise/data/models/movie.dart';
import 'package:exercise/routes/routes.gr.dart';
import 'package:exercise/util/date_formatter.dart';
import 'package:flutter/material.dart';

class MovieList extends StatelessWidget {
  final int length;
  final List<Movie> movies;

  const MovieList({Key? key, required this.length, required this.movies})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
        itemCount: length,
        itemBuilder: ((context, index) {
          return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Stack(alignment: Alignment.bottomCenter, children: [
                  InkWell(
                    onTap: () =>
                        context.router.push(Character(movie: movies[index])),
                    child: Image.network(
                      movies[index].img!,
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
                            movies[index].name!,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 22),
                          ),
                        ),
                        Text(
                          DateFormater.format(movies[index].birthday!),
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
    );
  }
}
