import 'package:flutter/material.dart';
import 'package:tugas_list_view/data_object.dart';

class listkelas extends StatefulWidget {
  const listkelas({Key? key}) : super(key: key);

  @override
  State<listkelas> createState() => _listkelasState();
}

class _listkelasState extends State<listkelas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
            width: MediaQuery.of(context).size.width,
            child:
                Text("LIST DATA SISWA 11 PPLG 1", textAlign: TextAlign.center)),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white12,
        child: ListView.builder(
            itemCount: datasiswa.length,
            itemBuilder: (BuildContext context, index) {
              return Container(
                margin: EdgeInsets.only(top: 10, bottom: 0),
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                height: 150,
                width: double.maxFinite,
                child: Card(
                  color: Colors.white30,
                  elevation: 5,
                  child: Stack(
                    children: [
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: CircleAvatar(
                              radius: 35,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: 10, right: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("ID: ${datasiswa[index].id}"),
                                  Text("Absen: ${datasiswa[index].absen}"),
                                  Text("Nama: ${datasiswa[index].nama}"),
                                  Text(
                                      "Nama Lengkap: ${datasiswa[index].nama_lengkap}"),
                                  Text("Asal: ${datasiswa[index].asal}"),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
