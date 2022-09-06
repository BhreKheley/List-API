import 'package:flutter/material.dart';
import 'package:tugas_list_view/ModelPremierLeague.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:tugas_list_view/AllFootballList.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key? key, required this.teams}) : super(key: key);
  Teams teams;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Page"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                  height: 100,
                  width: 100,
                  child: Image(
                    image:
                        NetworkImage("${widget.teams.strTeamBadge.toString()}"),
                  ),
                ),
                Container(
                  child: Text(
                    widget.teams.strTeam.toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                    height: 500,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.fromLTRB(25, 25, 25, 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.grey),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(25),
                            alignment: Alignment.centerLeft,
                            child:
                                Text(widget.teams.strDescriptionEN.toString()),
                          ),
                          SizedBox(
                            height: 0,
                          )
                        ],
                      ),
                    )),
                Container(
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          width: 35,
                          height: 35,
                          child: InkWell(
                            onTap: () {
                              var myUrl1 = "https://" +
                                  widget.teams.strInstagram.toString();
                              _launchInBrowser(myUrl1);
                            },
                            child: Image(
                                image: NetworkImage(
                                    "https://upload.wikimedia.org/wikipedia/commons/thumb/5/58/Instagram-Icon.png/1200px-Instagram-Icon.png")),
                          )),
                      Container(
                          width: 35,
                          height: 35,
                          child: InkWell(
                            onTap: () {
                              var myUrl2 = "https://" +
                                  widget.teams.strFacebook.toString();
                              _launchInBrowser(myUrl2);
                            },
                            child: Image(
                                image: NetworkImage(
                                    "https://www.facebook.com/images/fb_icon_325x325.png")),
                          )),
                      Container(
                          width: 35,
                          height: 35,
                          child: InkWell(
                            onTap: () {
                              var myUrl3 = "https://" +
                                  widget.teams.strTwitter.toString();
                              _launchInBrowser(myUrl3);
                            },
                            child: Image(
                                image: NetworkImage(
                                    "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Twitter-logo.svg/1200px-Twitter-logo.svg.png")),
                          )),
                      Container(
                          width: 35,
                          height: 35,
                          child: InkWell(
                            onTap: () {
                              var myUrl4 = "https://" +
                                  widget.teams.strYoutube.toString();
                              _launchInBrowser(myUrl4);
                            },
                            child: Image(
                                image: NetworkImage(
                                    "https://yt3.ggpht.com/584JjRp5QMuKbyduM_2k5RlXFqHJtQ0qLIPZpwbUjMJmgzZngHcam5JMuZQxyzGMV5ljwJRl0Q=s900-c-k-c0x00ffffff-no-rj")),
                          )),
                    ],
                  ),
                )

                // Text(widget.teams.strDescriptionEN.toString()),
                // InkWell(
                //     onTap: () {
                //       var myUrl =
                //           "https://" + widget.teams.strYoutube.toString();
                //       _launchInBrowser(myUrl);
                //     },
                //     child: Icon(Icons.play_arrow))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
