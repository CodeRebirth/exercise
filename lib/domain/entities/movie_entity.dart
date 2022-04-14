// ignore_for_file: unnecessary_this

import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final int? charId;
  final String? name;
  final String? birthday;
  final List<String>? occupation;
  final String? img;
  final String? status;
  final String? nickname;
  final List<int>? appearance;
  final String? portrayed;
  final String? category;
  final List<int>? betterCallSaulAppearance;

  const MovieEntity(
      {this.charId,
      this.name,
      this.birthday,
      this.occupation,
      this.img,
      this.status,
      this.nickname,
      this.appearance,
      this.portrayed,
      this.category,
      this.betterCallSaulAppearance});

  @override
  List<Object?> get props => [
        this.charId,
        this.name,
        this.birthday,
        this.occupation,
        this.img,
        this.status,
        this.nickname,
        this.appearance,
        this.portrayed,
        this.category,
        this.betterCallSaulAppearance
      ];
}
