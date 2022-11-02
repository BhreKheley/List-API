import 'package:flutter/material.dart';
import 'package:tugas_list_view/dbFootball.dart';
import 'package:tugas_list_view/favorite.dart';

class ListFav extends StatefulWidget {
  const ListFav({Key? key}) : super(key: key);

  @override
  State<ListFav> createState() => _ListFavState();
}

class _ListFavState extends State<ListFav> {
  List<PremierLeagueFootballFav> dataTeamfavlist = [];
  bool isLoading = false;
  bool checkExist = false;

  Future read() async {
    setState(() {
      isLoading = true;
    });
    dataTeamfavlist = await FootballDatabase.instance.readAll();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    dataTeamfavlist;
    super.initState();
    read();
  }

  showDeleteDialog(BuildContext context, int Index) {
    // set up the button
    Widget cancelButton = TextButton(
      child: Text("Tidak"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget okButton = TextButton(
      child: Text("Hapus"),
      onPressed: () async {
        setState(() {
          isLoading = true;
        });
        await FootballDatabase.instance.delete(dataTeamfavlist[Index].title!);
        read();
        setState(() {
          isLoading = false;
        });
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      content: Text("Apakah anda yakin ingin menghapus?"),
      actions: [cancelButton, okButton],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Favorite"),
      ),
      body: ListView.builder(
          itemCount: dataTeamfavlist.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(10),
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: Colors.white,
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Center(
                            child: Image.network(
                                dataTeamfavlist[index].teambadge.toString())),
                      ),
                      Container(
                        child: Text(
                          dataTeamfavlist[index].title.toString(),
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            showDeleteDialog(context, index);
                          },
                          icon: Icon(Icons.delete, color: Colors.red))
                      // Spacer(),
                      // IconButton(
                      //     icon: Icon(Icons.favorite, size: 30),
                      //     color: checkExist
                      //         ? Colors.red
                      //         : Colors.black.withOpacity(.5),
                      //     onPressed: () {
                      //       checkExist
                      //           ? deleteData(premierLeagueFootball!
                      //           .teams![index].strTeam
                      //           .toString())
                      //           : addData(
                      //           premierLeagueFootball!
                      //               .teams![index].strTeam
                      //               .toString(),
                      //           premierLeagueFootball!
                      //               .teams![index].strTeamBadge
                      //               .toString());
                      //     }),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
