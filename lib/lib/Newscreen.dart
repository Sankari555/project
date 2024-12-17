import 'package:flutter/material.dart';

class Newscreen extends StatefulWidget {
  final Map<String, dynamic>? product;
  const Newscreen({super.key, this.product});

  @override
  State<Newscreen> createState() => _NewscreenState();
}

class _NewscreenState extends State<Newscreen> {


  var selctedProduct = {};
  @override
  void initState() {    // TODO: implement initState
    super.initState();
    selctedProduct = widget.product!;
    print("Reuseable widget");
    print("${widget.product}");
    print("${widget.product!["title"]}");
    print("Reuseable widget");
  }

  @override
  Widget build(BuildContext context) {
    // int index= Text("${product["id"]}");
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        Row(children: [
          productimage(),
          selectedproductimage(),
          Container(
            margin: EdgeInsets.all(8),
            height: h,
            width: w / 1.5,
            padding: EdgeInsets.only(left: 10.0),
            //decoration: BoxDecoration(
            //     //color: Colors.yellow,

            //     border: Border.all(
            //   color: Colors.black,
            //   width: 2.0,
            // )

            //),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${selctedProduct["title"]}",
                        
                        style: TextStyle(fontSize: 20)),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          height: 20,
                          width: 35,
                          padding: EdgeInsets.only(left: 3.0),
                          color: Colors.green,
                          child: Text(
                            "${selctedProduct["rating"]}",
                            //"3.9"
                          ),
                        ),
                        SizedBox(width: 10),
                        Text("3,861 Ratings & 750 Reviews")
                      ],
                    ),
                    SizedBox(height: 8),
                    Text("Special price",
                        style: TextStyle(color: Colors.green)),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Text("${selctedProduct["price"]}",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                        SizedBox(width: 10),
                        Text("₹2,499",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey.shade400,
                                decoration: TextDecoration.lineThrough)),
                        SizedBox(width: 10),
                        Text("43% off",
                            style:
                                TextStyle(fontSize: 18, color: Colors.green)),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text("Available offers",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),

                    bankoffers(
                        "Bank Offer 5% Unlimited Cashback on Flipkart Axis Bank Credit Card"),
                        SizedBox(height: 10),
                    bankoffers(
                        "Bank Offer 10% off up to ₹1,500 on all Axis Bank Credit Card (incl. migrated ones) EMI Txns, on orders of ₹5000"),
                        SizedBox(height: 10),
                    bankoffers("Bank Offer 10% off up to ₹1,500 on Flipkart Axis Bank Credit Card EMI Txns, on orders of ₹5,000 and above"),
                    SizedBox(height: 10), 
                    bankoffers("Special PriceGet extra 10% off (price inclusive of cashback/coupon)"),

                    SizedBox(height: 20),
                    Row(
                      children: [
                        Container(
                          height: 25,
                          width: 45,
                          decoration: BoxDecoration(
                          //color: Colors.green,
                          border: Border.all(color: Colors.black),
                          ),
                         child:  Image.network("https://rukminim2.flixcart.com/image/160/160/cms-brand/dd8a352b43459cef8572a527a7f93a80aaa73ca16a1c761381d7fb037e0f6e57.jpg?q=90"),
                         
                        ),
                        SizedBox(width: 75),
                        Text("12 months warranty with product registration"),
                        SizedBox(width: 10),
                        InkWell(
                          onTap: () {
                            print("Know more");
                          },
                          child: Text(
                            "Know More",
                            style: TextStyle(color: Colors.blue),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          'Delivery',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 60),
                        Container(
                          width: 400,
                          child: Column(
                            children: [
                              Form(
                                key: _formKey,
                                child: TextField(
                                  controller: TextEditingController(),
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.location_on),
                                    hintText: "Enter Delivery Pincode",
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.only(
                                          bottom:
                                              4.0), // Optional padding for spacing
                                      child: Text(
                                        'Check', // Text at the end of the text field
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.blue),
                                      ),
                                      //),
                                    ),
                                  ),
                                ),
                              ),
                              Row(children: [
                                Text(
                                  'Delivery by 28 Nov, Thursday',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 10),
                                Divider(),
                                Text(
                                  'Free',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  '₹40',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ]),
                              Row(
                                children: [
                                  Text(
                                    'if ordered before 5:59 PM',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Text(
                                    'View Details',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          'Highlights',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 45),
                        Container(
                          width: 300,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.done_outlined),
                                  SizedBox(width: 5),
                                  Text("Cordless")
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Icon(Icons.done_outlined),
                                  SizedBox(width: 5),
                                  Text("1 Speed Settings")
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Icon(Icons.done_outlined),
                                  SizedBox(width: 5),
                                  Text("Rechargeable")
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Icon(Icons.done_outlined),
                                  SizedBox(width: 5),
                                  Text("Waterproof")
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Services',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 50),
                        Container(
                          width: 300,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.warehouse, color: Colors.blue),
                                  SizedBox(width: 5),
                                  Text("12 months warranty with product")
                                ],
                              ),
                              SizedBox(width: 5),
                              Row(
                                children: [Text("         registration")],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Icon(Icons.currency_rupee,
                                      color: Colors.blue),
                                  SizedBox(width: 5),
                                  Text("Cash on Delivery available"),
                                  Icon(Icons.help_rounded)
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        Text(
                          'Seller',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 70),
                        Container(
                          width: 500,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text("Noymi",
                                      style: TextStyle(color: Colors.blue)),
                                  SizedBox(width: 9),
                                  Container(
                                    height: 20,
                                    width: 30,
                                    padding: EdgeInsets.only(left: 4.0),
                                    child: Text("3.4  ",
                                        style: TextStyle(color: Colors.white)),
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Icon(Icons.done_outlined),
                                  SizedBox(width: 5),
                                  Text("7 Days Replacement Policy"),
                                  SizedBox(width: 5),
                                  Icon(Icons.help, color: Colors.grey),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  InkWell(
                                      onTap: () {
                                        print("Other sellers are");
                                      },
                                      child: Text("See other sellers",
                                          style:
                                              TextStyle(color: Colors.blue))),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          'Description',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 30),
                        Container(
                          width: 700,
                          child: Text("${selctedProduct["description"]}"
                              
                              ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Container(
                        width: 950,
                        //height: 600,

                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Text("Product Description",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 26)),
                            ),
                            Divider(indent: 0.0, endIndent: 0.0),
                            Row(
                              children: [
                                Container(
                                  width: 200,
                                  height: 200,
                                  margin: EdgeInsets.all(25),
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    // border: Border.all(
                                    //color: Colors.black)
                                  ),
                                  child: Image.network(
                                      "https://rukminim2.flixcart.com/image/200/200/xif0q/icons/original-SHVG42MUZ3UBW7MV_1.jpg"),
                                ),
                                SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Waterproof Shaver",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 10),
                                    Container(
                                        width: 550,
                                        //height: 200,
                                        child: Text(
                                          "This 100 percent waterproof electric shaver is designed so you can use it without worrying about water damage. Use it in the shower or shave over the sink. This shaver and trimmer is designed with IPX7 technology to keep the grooming device safe from water damage or electrocution. Keep it clean by running it under water after you are done using it for the day.",
                                          style: TextStyle(fontSize: 16),
                                        )),
                                  ],
                                ),
                              ],
                            ),
                            Divider(),

                            // SizedBox(height: 10),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "    Rechargeable for Continued Usage",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 5),
                                    Container(
                                        width: 550,
                                        //height: 200,
                                        padding: EdgeInsets.all(20),
                                        child: Text(
                                          "With this electric shaver, gone are the days when you would have to worry whether only half of your face would be shaved. Featuring rechargeable functionality, simply keep it plugged in for a couple of hours before you use it, and that is it! With its long battery life, you can use it uninterrupted for up to 90 minutes. Don't have time to charge it for two hours but need to do a quick shave? Then quickly charge it for ten minutes, and you are all set!",
                                          style: TextStyle(fontSize: 16),
                                        )),
                                  ],
                                ),
                                SizedBox(width: 20),
                                Container(
                                  width: 200,
                                  //  height: 200,
                                  margin: EdgeInsets.all(25),
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    //border: Border.all(color: Colors.black)
                                  ),
                                  child: Image.network(
                                      "https://rukminim2.flixcart.com/image/200/200/xif0q/icons/original-SHVG42MUZ3UBW7MV_2.jpg"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    //Divider(),
                    SizedBox(height: 10),
                    Center(
                      child: Container(
                        padding: EdgeInsets.all(15),
                        margin: EdgeInsets.all(15),
                        // height: 350,
                        width: 950,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Specifications",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 26)),
                              Divider(indent: 0.0, endIndent: 0.0),
                              Text("General", style: TextStyle(fontSize: 20)),
                              SizedBox(height: 10),
                              specificationstext(
                                  "Category", "${selctedProduct["category"]}"),
                              SizedBox(height: 10),
                              specificationstext(
                                  "Brand", "${selctedProduct["brand"]}"),
                              SizedBox(height: 10),
                              specificationstext("Model Number",
                                  "3D Rechargeable 100% Waterproof IPX7 Electric Shaver Wet"),
                              SizedBox(height: 10),
                              specificationstext("Model Name", "ET-175 Shaver"),
                              SizedBox(height: 10),
                              specificationstext("Ideal For", "Men"),
                              SizedBox(height: 10),
                              specificationstext("Color", "Black"),
                              SizedBox(height: 10),
                              specificationstext("Series", "X-Series"),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 10),
                  ]),
            ),
          )
        ])
      ]),
    ));
  }

  Widget productimage() {
    return Container(
      height: 800,
      width: 150, // Set a fixed height for the image display area
      child: ListView.builder(
        //scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(), // Horizontal list
        itemCount: selctedProduct["images"].length,
        itemBuilder: (context, imageIndex) {
          return Container(
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            child: Image.network(
              selctedProduct["images"][imageIndex],
              fit: BoxFit.cover,
              width: 150, // Width of each image
            ),
          );
        },
      ),
    );
  }

  Widget selectedproductimage() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.topCenter,
            width: 400,
            height: 500,
            // color: Colors.blue,
            child: Image.network("${selctedProduct["thumbnail"]}"),
          ),
          SizedBox(height: 15),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Container(
              alignment: Alignment.center,
              //height: 70,
              width: 200,
              child: ElevatedButton.icon(
                onPressed: () {
                  print("ADDED TO CART");
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.amber),
                  padding: WidgetStatePropertyAll(EdgeInsets.all(15)),
                ),

                icon: (Icon(Icons.card_travel)),
                //SizedBox(width: 5),
                label: Text("ADD TO CART"),
              ),
            ),
            SizedBox(width: 5),
            Container(
              //height: 70,
              //width: 30,
              child: ElevatedButton.icon(
                onPressed: () {
                  print("buy now");
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.amber),
                  padding: WidgetStatePropertyAll(EdgeInsets.all(20)),
                ),

                icon: (Icon(Icons.card_travel)),
                //SizedBox(width: 5),
                label: Text("BUY NOW"),
              ),
            ),
          ]),
        ],
      ),
    );
  }

  Widget specificationstext(label, value) {
    return Row(
      children: [
        Container(
          width: 120,
          child: Text(
            //"Category"
            label,
            style: TextStyle(color: Colors.grey),
          ),
        ),
        SizedBox(width: 10),
        Text(
          //"${selctedProduct["category"]}"
          value,
          // "charging cable, brush, sharpad cutter head, 3MM 5MM 7MM Shaver cap"
        ),
      ],
    );
  }

  Widget bankoffers(label) {
    return Row(
      children: [
        Icon(Icons.bookmark, color: Colors.green),
        SizedBox(width: 10),
        Text(label),
        SizedBox(width: 10),
        InkWell(
          onTap: () {
            print("");
          },
          child: Text(
            "T&C",
            style: TextStyle(color: Colors.blue),
          ),
        )
      ],
    );
  }
}
