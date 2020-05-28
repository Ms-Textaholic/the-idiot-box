import 'package:flutter/material.dart';
import 'package:theidiotbox/models/movies.dart';
import 'items.dart';

class ListViewModel extends StatelessWidget {
  final List<Movie> name;
  final  Function itemClick;

  ListViewModel({this.name, this.itemClick});

//  Future<void> search(String keyword) async{
//    final results = await Service().search(keyword);
//    this.name = results.map((item) => Item(movie: item,)).toList();
//    notifyListeners();
//  }

  Widget build(context) {
    return Container(
        decoration: BoxDecoration(color: Colors.grey),
        child: ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: this.name.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                   child: Item(movie: this.name[index]),
                  onTap: () => this.itemClick(this.name[index]));
            }));
  }
}