import 'package:flutter/material.dart';
import 'package:theidiotbox/models/movies.dart' as models;

class Item extends StatelessWidget {
  final models.Movie movie;

  Item({this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Column(children: <Widget>[
            if (this.movie.poster != "N/A")
              Image.network(
                  this.movie.poster,
                  height: 100,
                  width: 100)
          ]),
          Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  this.movie.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text(this.movie.genre),
                Row(
                  children: <Widget>[
                    Text(this.movie.imdbRating),
                    Icon(Icons.star)
                  ],
                )
              ]),)
        ],
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 8, left: 10, right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Colors.white,
      ),
    );
  }
}