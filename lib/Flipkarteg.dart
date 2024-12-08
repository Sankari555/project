import 'package:flutter/material.dart';

import 'package:project/Newscreen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';




class Flipkarteg extends StatefulWidget {
  const Flipkarteg({super.key});

  @override
  State<Flipkarteg> createState() => _FlipkartegState();
}

class _FlipkartegState extends State<Flipkarteg> {

  late Future<List<Map<String, dynamic>>> productdata;

   Future<List<Map<String, dynamic>>> fetchData() async {
    final url = Uri.parse('https://dummyjson.com/products'); // Example API
    try {
      final response = await http.get(url);
     // final response = await http.get(url);
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        return List<Map<String, dynamic>>.from(responseData["products"]);
      } else { 
        throw Exception("error");
        
      }
    } catch (error) {
      throw Exception("error");
      
    }
  }

  @override
  void initState() {
    productdata = fetchData();
   
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    // int startIndex = 1;
    // int endIndex = 30;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Title(color: Colors.black, 
        
        child: Text("Beautykart", 
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300, fontFamily: "Roboto", fontStyle: FontStyle.italic )),
        ),
      centerTitle: true,
        
        
      ),
      body: FutureBuilder(
        future: productdata,
        builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting)
          {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else if(snapshot.hasError)
          {
           return Text("Error");
          }
          else if(snapshot.hasData)
          {
            
          
          return SingleChildScrollView(
            child: Column(
              children: [
                
                GridView.builder(
                  shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,  // 2 items per row
                            crossAxisSpacing: 10,  // Space between items horizontally
                            mainAxisSpacing: 10,  // Space between items vertically
                          ),
                          
                          itemCount: snapshot.data!.length,  // Number of items in the grid
                          itemBuilder: (context, index) {
                            var product = snapshot.data![index];
                            return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Newscreen(product: snapshot.data![index])),
                          );
                        },
                            
                        
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                          ),
                          margin: EdgeInsets.all(5),
                          child: Column(
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //Image.asset(product[index]['images']!),
                              Image.network("${product["thumbnail"]}",
                                  width: 200, height: 200),
                              // Image widget
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("${product["title"]}"),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${product["price"]}",
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
                            ],
                          ),
                        ),
                            );
                          }
                ),
                      
                
              ],
            ),
          );
        }
        else{
          return Text("No product");
        }
        }
      ),
    );
  }
}
