import 'package:flutter/material.dart';
import 'package:tugas_list_view/DetailPage.dart';
import 'package:tugas_list_view/ModelPremierLeague.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ListAllFootbal extends StatefulWidget {
  const ListAllFootbal({Key? key}) : super(key: key);

  @override
  State<ListAllFootbal> createState() => _ListAllFootbalState();
}

class _ListAllFootbalState extends State<ListAllFootbal> {
  ModelPremierLeague? premiereLeague;
  bool isloaded = true;

  void getAllListPL() async {
    setState(() {
      isloaded = false;
    });
    final res = await http.get(
      Uri.parse(
          "https://www.thesportsdb.com/api/v1/json/2/search_all_teams.php?l=English%20Premier%20League"),
    );
    print("status code " + res.statusCode.toString());
    premiereLeague =
        ModelPremierLeague.fromJson(json.decode(res.body.toString()));
    print("team 0 : " + premiereLeague!.teams![0].strTeam.toString());
    setState(() {
      isloaded = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllListPL();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Premiere League"),
      ),
      body: Center(
        child: Container(
          child: isloaded
              ? ListView.builder(
                  itemCount: premiereLeague!.teams!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailPage(
                                  teams: premiereLeague!.teams![index])),
                        );
                      },
                      child: Card(
                        child: Container(
                          margin: EdgeInsets.all(15),
                          child: Row(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(right: 20),
                                  width: 50,
                                  height: 50,
                                  child: Image(
                                      image: NetworkImage(
                                          "${premiereLeague!.teams![index].strTeamBadge.toString()}"))),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(premiereLeague!.teams![index].strTeam
                                      .toString()),
                                  Text(premiereLeague!.teams![index].strStadium
                                      .toString()),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  })
              : CircularProgressIndicator(),
        ),
      ),
    );
  }
}
