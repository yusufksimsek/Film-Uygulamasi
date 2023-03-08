import 'package:flutter/material.dart';
import 'package:gridview_filmuygulamasi/FilmlerUygulamasi/DetaySayfa.dart';

import 'Filmler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<List<Filmler>> filmleriGetir() async {

    var filmlerListesi = <Filmler>[];

    var f1 = Filmler(1, "Bir Zamanlar Anadolu'da", "anadoluda.png", 8.99);
    var f2 = Filmler(2, "Django", "django.png", 14.99);
    var f3 = Filmler(3, "Inception", "inception.png", 19.99);
    var f4 = Filmler(4, "Intersteallar", "interstellar.png", 24.99);
    var f5 = Filmler(5, "The Hateful Eight", "thehatefuleight.png", 8.99);
    var f6 = Filmler(6, "The Pianist", "thepianist.png", 14.99);

    filmlerListesi.add(f1);
    filmlerListesi.add(f2);
    filmlerListesi.add(f3);
    filmlerListesi.add(f4);
    filmlerListesi.add(f5);
    filmlerListesi.add(f6);

    return filmlerListesi;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filmler"),
      ),
      body: FutureBuilder<List<Filmler>>(
        future: filmleriGetir(),
        builder: (context,snapshot){
          if(snapshot.hasData){

            var filmlerListesi = snapshot.data;

            return GridView.builder(
                itemCount: filmlerListesi?.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2/3.5,
                ),
                itemBuilder: (context,index){
                  var film = filmlerListesi![index];

                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(film: film)));
                    },
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("resimler/${film.film_resim_adi}"),
                          ),
                          Text(film.film_adi,style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold),),
                          Text("${film.film_fiyat} \u{20BA}",style: TextStyle(color: Colors.deepPurple,fontSize: 15,fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  );
                }
            );

          }else{
            return Center();
          }
        },
      ),

    );
  }
}
