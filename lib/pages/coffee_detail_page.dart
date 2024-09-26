import 'package:coffee/data/coffee_list.dart';
import 'package:coffee/goggle_fonts.dart';
import 'package:coffee/model/card_model.dart';
import 'package:coffee/model/coffee_class.dart';
import 'package:coffee/pages/order_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CoffeeDetailPage extends StatefulWidget {
  final CoffeeClass coffee;

  CoffeeDetailPage({required this.coffee});

  @override
  _CoffeeDetailPageState createState() => _CoffeeDetailPageState();
}

class _CoffeeDetailPageState extends State<CoffeeDetailPage> {
  bool favorite = false;
  bool isExpanded = false;
  String selectedSize = 'M'; // Default selected size

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.coffee.name, style: myStyle(22)),
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                setState(() {
                  favorite = !favorite;
                });
              },
              child: Icon(
                favorite ? Icons.favorite : Icons.favorite_border,
                color: Colors.black,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 245,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage(widget.coffee.image),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                widget.coffee.name,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Ice/hot",style: myStyle(15,Colors.grey),),
                  Row(
                    children: [
                      Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.withOpacity(0.1),
                          ),
                          child: Icon(Icons.wheelchair_pickup_outlined,size: 30,color: one,),
                      ),
                      Gap(10),
                      Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.withOpacity(0.1),
                          ),
                          child: Image(image: AssetImage("assets/image/6.png"),fit: BoxFit.cover,)
                      ),
                      Gap(10),
                      Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.withOpacity(0.1),
                          ),
                          child: Image(image: AssetImage("assets/image/2-removebg-preview.png"),fit: BoxFit.cover,)
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.star,color: Colors.yellow,size: 26,),
                  Text(
                    "${widget.coffee.rating}",
                    style: myStyle(18,three,FontWeight.bold),
                  ),
                  Text("(230)",style: myStyle(14,Colors.grey),),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Divider(color: Colors.grey, thickness: 1.5),
              ),
              SizedBox(height: 6),
              Text("Description",style: myStyle(20,Colors.black,FontWeight.bold),),
              SizedBox(height: 10),
              Text(
                isExpanded
                    ? widget.coffee.berif
                    : widget.coffee.berif.substring(0, 100) + '...',
                style: myStyle(18,),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Text(
                  isExpanded ? "Show Less" : "Read More",
                  style: myStyle(18,one,FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text("Size",style: myStyle(20,Colors.black,FontWeight.bold),),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildSizeButton("S"),
                  _buildSizeButton("M"),
                  _buildSizeButton("L"),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text('Price',style:myStyle(19, Colors.grey,),),
                      Text(
                        "\$${widget.coffee.price}",
                        style: myStyle(22, one, FontWeight.bold,),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      CartModel.addItem(widget.coffee);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => OrderPage(coffeeClass: widget.coffee,)),
                      );
                    },
                    child: Text("             By Now             ", style: myStyle(15, Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: one,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSizeButton(String size) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          selectedSize = size;
        });
      },
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: selectedSize == size ? one : Colors.grey,
          width: 2,
        ),
      ),
      child: Text(
        size,
        style: TextStyle(
          fontSize: 16,
          color: selectedSize == size ? one : Colors.black,
        ),
      ),
    );
  }
}
