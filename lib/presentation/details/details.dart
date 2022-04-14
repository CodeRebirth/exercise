import 'package:exercise/util/date_formatter.dart';
import 'package:flutter/material.dart';

import '../../data/models/movie.dart';

class Character extends StatelessWidget {
  final Movie movie;
  const Character({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        backgroundColor: Colors.green,
      ),
      body: Stack(alignment: Alignment.bottomCenter, children: [
        SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              movie.img!,
              fit: BoxFit.cover,
            )),
        SizedBox(
          height: 200,
          width: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(movie.name!,
                    style: const TextStyle(color: Colors.white, fontSize: 18)),
              ),
              Text(DateFormater.format(movie.birthday!),
                  style: const TextStyle(color: Colors.white, fontSize: 16))
            ],
          ),
        )
      ]),
    );
  }
}
