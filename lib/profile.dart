import 'package:flutter/material.dart';

class AboutMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
          ),
        backgroundColor: Colors.transparent,
        ),
        body: Column(
          children: <Widget>[
            Container(
              child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [
                    0.4,0.5,0.7,1.5,
                  ],
                  colors: [Color(0xffffd0d2), Color(0xfffffdd0), Color(0xffd0fffd), Color(0xffd0d2ff)]
                ),
              ),
              child: Container (
                width: double.infinity,
                height: 180.0,
                child: Center(
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: <Widget> [
                      Positioned(
                        bottom: -50,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage("assets/images/KR51.jpeg"),
                          radius: 50.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ),
            Flexible(
            child: Container(
              child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height:50),
                  const ListTile(
                        title: Center(child: Text('Sonia Rahmawati', style: TextStyle(fontSize: 20),)),
                        subtitle: Center(child: Text('~Sonia~'),),
                            ),
                  Card(
                        color: Colors.lightBlue[50],
                        shadowColor: Colors.blue,
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget> [
                            SizedBox(height:8),
                            const ListTile(
                            title: Text('About me', style: TextStyle(fontSize: 20),),
                            subtitle: Text('\nHalo~ \nSaya Sonia Rahmawati, seorang mahasiswa Ilmu Komputer UI 2019. Saya berasal dari Padang Pariaman, Sumatera Barat. Kuliah di jurusan ini adalah impian saya sejak lama. Saya berharap bisa mendapat ilmu dan pengalaman sebanyak - banyaknya selama kuliah di sini.'),
                            ),
                            SizedBox(height:12)
                          ],
                        ),
                      ),
                      SizedBox(height:15.0),
                  Card(
                    color: Colors.lightBlue[50],
                    clipBehavior: Clip.antiAlias,
                    elevation: 5.0,
                    shadowColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height:8),
                        Text('Hobi', style: TextStyle(fontSize: 20),),
                        Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 22.0),
                        child: Row(
                          children: <Widget>[
                            Card(
                              color: Colors.pink[100],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                ),
                              shadowColor: Colors.black,
                              elevation: 5.0,
                              child: Column(
                                children: const <Widget>[
                                  Icon(Icons.music_video, size: 36.0,),
                                  Text('Mendengarkan musik')
                                ],
                              ),
                            ),
                            Card(
                              color: Colors.pink[100],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                ),
                              shadowColor: Colors.black,
                              elevation: 5.0,
                              child: Column(
                                children: const <Widget>[
                                  Icon(Icons.book, size: 36.0,),
                                  Text('Membaca buku'),
                                ],
                              ),
                            ),
                            Card(
                              color: Colors.pink[100],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                ),
                              shadowColor: Colors.black,
                              elevation: 5.0,
                              child: Column(
                                children: const <Widget>[
                                  Icon(Icons.video_label, size: 36.0,),
                                  Text("Nonton drakor/film"),
                                ],
                              ),
                            ),
                          ],
                        ),
                        )],
                    ),
                  ),
                  SizedBox(height:15.0),
                  Card(
                    color: Colors.lightBlue[50],
                    shadowColor: Colors.blue,
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget> [
                        SizedBox(height:8),
                        const ListTile(
                        title: Center(child:Text('Media Sosial', style: TextStyle(fontSize: 20)),),
                        subtitle: Text('\nInstagram : @sonia_rahma27 \nLine : soniarahma27 \nEmail : soniarahma27@gmail.com'),
                        ),
                      ],
                    ),
                    ),
                ],
              ),
            ),
            ))],
            
            )
    );
    
  }
}