import 'package:bookery/library.dart';
import 'package:bookery/models/book.dart';
import 'package:bookery/services/services_library.dart';
import 'package:bookery/ui/screens/home/home_viewModel.dart';
import 'package:bookery/ui/ui_library.dart';

class HomeView extends StatelessWidget {

  static HomeViewModel _model = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        searchBar: true,
        leading: null,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () async {
              _model.deleteAccount();
            },
          )
        ],
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: BookService.fetchBooksByQuery("Kiss online", searchBy: SearchBy.title, sortBy: SortBy.mostRelevant),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              var result = snapshot.data as List<Book>;
              return ListView.builder(
                itemCount: result.length,
                itemBuilder: (_, index) {
                  return GFListTile(
                    padding: EdgeInsets.all(10),
                    title: AutoSizeText(
                      result[index].title, 
                      maxLines: 3
                    ),
                    avatar: result[index].coverUrl != null ? Image.network(result[index].coverUrl, scale: 1.75) : Icon(Icons.error),
                    subTitle: AutoSizeText(
                      "\n" + result[index].authors.toString(),
                      maxLines: 2,
                    ),
                    description: Text(
                      "Seiten: " + (result[index].pages == null ? "unbekannt \n" : result[index].pages.toString() + "\n") +
                      "Klapptext: " + (result[index].description == null ? "unbekannt" : result[index].description.toString() + "\n")
                    ),
                  );
                },
              );
            } else {
              return Text("Loading...");
            }
          } 
        )
      )
    );
  }

}