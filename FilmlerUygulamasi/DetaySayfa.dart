import 'package:flutter/material.dart';
import 'package:gridview_filmuygulamasi/FilmlerUygulamasi/Filmler.dart';

class DetaySayfa extends StatefulWidget {


  Filmler film;


  DetaySayfa({required this.film});

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.film.film_adi),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("resimler/${widget.film.film_resim_adi}"),
            Text("${widget.film.film_fiyat} \u{20BA}",style: TextStyle(color: Colors.deepPurple,fontSize: 36,fontWeight: FontWeight.bold)),
            SizedBox(
              width: 200,
              height: 50,
              child: TextButton(
                  onPressed: (){
                    //print("${widget.film.film_adi} Kiralandı");

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text("Kiralamak istediğinize emin misiniz?"),
                        action: SnackBarAction(
                            label: "Evet",
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Film Kiralandı"),),
                              );
                            },
                        ),
                      ),
                    );

                  },
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
                  child: Text("KİRALA",style: TextStyle(color: Colors.white,fontSize: 20),),
              ),
            ),
          ],
        ),
      ),

    );
  }
}
