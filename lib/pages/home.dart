import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'faktor_permasalahan.dart';
import 'lihat_detail.dart';
import 'total_responden_gender.dart';
import 'total_responden_negara.dart';

final dio = Dio();

var all_data = [];

String url_domain = "http://192.168.100.19:8000/";
String url_all_data = url_domain + "api/all_data";
String url_create_data = url_domain + "api/create_data";
String url_show_data = url_domain + "api/show_data";
String url_update_data = url_domain + "api/edit_data";
String url_delete_data = url_domain + "api/delete_data";

@override
void initState() {
  initState();
  fetchDataFromApi();
}

Future<void> fetchDataFromApi() async {
  try {
    final response =
        await Dio().post("https://192.168.2.37:8000/count_responden");
    if (response.statusCode == 200) {
      final responseData = response.data;
      setState(() {
        totalResponden = responseData['total_responden'];
      });
    } else {
      // Handle error jika status code bukan 200
      print('Gagal mengambil data dari API');
    }
  } catch (e) {
    // Handle error lainnya, misalnya masalah jaringan
    print('Terjadi kesalahan: $e');
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 180,
                    decoration: BoxDecoration(
                      color: Colors.red[800],
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50)),
                    ),
                  ),
                  Positioned(
                      top: 5,
                      left: 5,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(7),
                        child: Container(
                            height: 40,
                            width: 40,
                            child: IconButton(
                              icon: Icon(
                                Icons.menu,
                                size: 30,
                              ),
                              onPressed: () {},
                            )),
                      )),
                  Positioned(
                    top: 20,
                    left: 40,
                    child: Image(
                      image: AssetImage("assets/judul.png"),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: ClipOval(
                      child: Image.asset("assets/logo.png"),
                    ),
                  ),
                ],
              ),
            ),
            //=============== BODY ====================
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Text(
                              "Hasil Survey dari Responden : ",
                              style: TextStyle(fontWeight: FontWeight.w900),
                            ),
                          ),
                          // ==================== Card ====================
                          GridView.count(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 1.3,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => lihat_detail()),
                                  );
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  elevation: 5,
                                  shadowColor: Colors.red,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 15),
                                        child: Text(
                                          "Total Responden",
                                          style: TextStyle(
                                            color: Colors.red[900],
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            "1005",
                                            style: TextStyle(
                                              color: Colors.blue[800],
                                              fontWeight: FontWeight.w800,
                                              fontSize: 30,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => lihat_detail()),
                                  );
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  elevation: 5,
                                  shadowColor: Colors.red,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 15),
                                        child: Text(
                                          "Umur Rata-rata Responden",
                                          style: TextStyle(
                                            color: Colors.red[900],
                                            fontWeight: FontWeight.w800,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            "21",
                                            style: TextStyle(
                                              color: Colors.blue[800],
                                              fontWeight: FontWeight.w800,
                                              fontSize: 30,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => lihat_detail()),
                                  );
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  elevation: 5,
                                  shadowColor: Colors.red,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 15),
                                        child: Text(
                                          "IPK / GPA Rata-rata",
                                          style: TextStyle(
                                            color: Colors.red[900],
                                            fontWeight: FontWeight.w800,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            "185",
                                            style: TextStyle(
                                              color: Colors.blue[800],
                                              fontWeight: FontWeight.w800,
                                              fontSize: 30,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            faktor_permasalahan()),
                                  );
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  elevation: 5,
                                  shadowColor: Colors.red,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 15),
                                        child: Text(
                                          "Faktor Permasalahan (Jumlah)",
                                          style: TextStyle(
                                            color: Colors.red[900],
                                            fontWeight: FontWeight.w800,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Icon(
                                            Icons.bar_chart,
                                            size: 50.0,
                                            color: Colors.red[800],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            responden_gender()),
                                  );
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  elevation: 5,
                                  shadowColor: Colors.red,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 15),
                                        child: Text(
                                          "Total Responden (Gender)",
                                          style: TextStyle(
                                            color: Colors.red[900],
                                            fontWeight: FontWeight.w800,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Icon(
                                            Icons.bar_chart,
                                            size: 50.0,
                                            color: Colors.red[800],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            responden_negara()),
                                  );
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  elevation: 5,
                                  shadowColor: Colors.red,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 15),
                                        child: Text(
                                          "Total Responden (Negara)",
                                          style: TextStyle(
                                            color: Colors.red[900],
                                            fontWeight: FontWeight.w800,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Icon(
                                            Icons.bar_chart,
                                            size: 50.0,
                                            color: Colors.red[800],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => lihat_detail()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[800],
                  padding: EdgeInsets.all(15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Lihat Detail Responden",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
