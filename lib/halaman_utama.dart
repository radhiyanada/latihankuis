import 'package:flutter/material.dart';
import 'package:latihankuis/rental_car.dart';
import 'package:latihankuis/halaman_detail.dart';

class HalamanList extends StatelessWidget {
  const HalamanList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rental Mobil'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: rentalCar.length,
        itemBuilder: (context, index){
          final RentalCar place = rentalCar[index];
          return InkWell(
            onTap: (){
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => HalamanDetail(place: place,),),
              );
            },
            child: Card(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.network(place.images[0], width: 200,),
                  ),
                  Container(
                    margin: EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(place.brand + ' ' + place.model,
                            style: TextStyle(
                                fontSize: 18,
                                fontStyle: FontStyle.italic
                            ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          place.rentalPricePerDay + ' / hari',
                          style: TextStyle(fontSize: 10),
                          textAlign: TextAlign.left,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
