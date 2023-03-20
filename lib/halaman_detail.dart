import 'package:flutter/material.dart';
import 'package:latihankuis/rental_car.dart';

class HalamanDetail extends StatefulWidget {
  final RentalCar place;
  const HalamanDetail({Key? key, required this.place}) : super(key: key);

  @override
  State<HalamanDetail> createState() => _HalamanDetailState();
}

class _HalamanDetailState extends State<HalamanDetail> {
  bool isTrue = true;
  bool isAvailable = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.place.brand + ' ' + widget.place.model),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Container(
                    height: MediaQuery.of(context).size.height / 3,
                    child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.place.images.length,
                      itemBuilder: (context, index){
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          child: Image.network(widget.place.images[index]),
                        );
                      },
                      pageSnapping: true,
                    ),
                ),
              ),
              Container(
                child: Text(
                  widget.place.brand + ' ' + widget.place.model,
                  style: TextStyle(fontSize: 30),
                ),
                padding: EdgeInsets.all(20),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.95,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: Text('Brand             : ' + widget.place.brand),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: Text('Model             : ' + widget.place.model),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: Text('Tahun            : ' + widget.place.year.toString()),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: Text('Biaya Sewa   : ' + widget.place.rentalPricePerDay),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: Row(
                        children: [
                          Text(
                            'Status            : ',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            widget.place.available ? 'Tersedia' : 'Tidak Tersedia',
                            style: TextStyle(
                              color: widget.place.available ? Colors.green : Colors.red,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              SizedBox(
                width: 0.95 * MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: widget.place.available
                  ? () {
                    setState(() {
                      widget.place.available = false;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Berhasil Dipesan!'),
                          backgroundColor: Colors.green,
                        ),
                    );
                  }
                  : null,
                  child: Text(widget.place.available ? 'Pesan' : 'Pesan'),
                  style: ElevatedButton.styleFrom(
                    primary: widget.place.available ? Colors.blue : Colors.grey,
                    textStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                width: MediaQuery.of(context).size.width * 0.95,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Deskripsi',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Text(widget.place.description),
                    SizedBox(height: 10.0),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

