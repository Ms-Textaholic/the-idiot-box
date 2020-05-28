import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:theidiotbox/models/movies.dart';
import 'package:theidiotbox/services/service.dart';
import 'package:theidiotbox/components/list_view_model.dart';
import 'package:theidiotbox/screens/details.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final searchTextController = TextEditingController();
  String searchText = "";

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  void itemClick(Movie item) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => Detail(
            movieName: item.title,
            imdbId: item.imdbId,
          )),
    );
  }


  @override
  Widget build(BuildContext context) {
    // final viewModel = Provider.of<ListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.3,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: Icon(
            Icons.arrow_back,
          color: Colors.black,
        ),
        title: Text(
            'The Idiot Box',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Row(children: <Widget>[
              Flexible(
                  child: TextField(
                    controller: searchTextController,
                    decoration: InputDecoration(
                        hintText: 'Enter an Item to Search!'
                    ),
                  ),
              ),
              IconButton(
                icon: Icon(Icons.search),
                tooltip: 'Search for Movies or Shows',
                onPressed: () => setState(() {
                      searchText = searchTextController.text;
                       // viewModel.search(searchText);
                    // searchTextController.clear();
                    SystemChannels.textInput.invokeMethod( 'TextInput.hide' );
                  }),
              ),
            ]),
            padding: EdgeInsets.all(10),
          ),
           if(searchText.length>0)
             FutureBuilder<List<Movie>>(
                future: search(searchText),
                builder: (context, snapshot){
                  if(snapshot.hasData){
                    return Expanded(
                      child: ListViewModel(
                        name: snapshot.data,
                        itemClick: this.itemClick,
                      ));
                  } else if(snapshot.hasError){
                    return Text("${snapshot.error}");
                  }
                  return CircularProgressIndicator();
                }),

           //Expanded(child: Detail(movieName: viewModel.movie)),
        ],
      ));
  }
}
