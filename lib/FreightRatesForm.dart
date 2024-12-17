import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class FreightRatesForm extends StatefulWidget {
  @override
  _FreightRatesFormState createState() => _FreightRatesFormState();
}

class _FreightRatesFormState extends State<FreightRatesForm> {
  bool _isFCLSelected = true;
  bool _isLCLSelected = false;
  bool _isOriginSelected = false;
  bool _isDestSelected = false;
  //String? selectedContainerSize;
  String? selectedValue = '40\' Standard';
  final List<String> items = [
    '20\' Standard',
    '40\' Standard',
    '60\' Standard'
  ];
  String? selected_Value = 'Commodity';
  final List<String> items1 = ['Commodity', 'Commodity 1', 'Commodity 2'];

  TextEditingController _dateController = TextEditingController();

  // Function to show the Date Picker
  Future<void> _selectDate(BuildContext context) async {
    // Show DatePicker
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      setState(() {
        // Update the text field with the selected date
        _dateController.text = "${pickedDate.toLocal()}"
            .split(' ')[0]; // Formats the date as yyyy-mm-dd
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(16),

            // height: 873,
            width: double.infinity,
            // 1440,
            decoration: BoxDecoration(
                color: Color(0xFFE6EAF8),
                border: Border.all(
                  color: Color(0xFFE6EAF8),
                )),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                padding: const EdgeInsets.all(16),
                height: 80,
                //width: 1440,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Search the best Freight Rates',
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                        // height: 29.64,
                        color: Color(0xFF212121),
                        letterSpacing: 0.25,
                      ),
                    ),
                    _buildElevatedButton(),
                  ],
                ),
              ),
              SizedBox(height: 35.0),
              Center(
                child: Container(
                  padding: EdgeInsets.all(32.0),
                  margin: EdgeInsets.all(32),
                  // height: 700.0,
                  //width: 1376.0,
                  decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      border: Border.all(
                        color: Color(0xFFFFFFFF),
                      ),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xFF000000),
                            blurRadius: 8.0,
                            spreadRadius: -3.0,
                            offset: Offset(0, 4))
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildOriginDestinationRow(),
                      const SizedBox(height: 12.0),
                      _buildPorts(),
                      SizedBox(height: 16.0),
                      Row(children: [
                        Container(
                          width: 645.0,
                         
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFFFFFFF), // Border color
                                ),
                              ),
                            ),
                            value: selected_Value,
                            items: items1.map((String item) {
                              return DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: TextStyle(
                                      fontFamily: 'PublicSans',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0XFF9E9E9E)),
                                ),
                              );
                            }).toList(),
                            icon: Image.asset('assets/Vector.png',
                                color: Color(0XFF707070)),
                            onChanged: (String? newValue) {
                              setState(() {
                                selected_Value = newValue;
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 24.0),
                        Container(
                          width: 638.0,
                          child: TextFormField(
                            controller: _dateController,
                            decoration: InputDecoration(
                              labelText: 'Cut Off Date',
                              labelStyle: TextStyle(
                                  fontFamily: 'PublicSans',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0XFF9E9E9E)),
                              suffixIcon: IconButton(
                                icon: Image.asset('assets/calendar.jpg'),
                                onPressed: () => _selectDate(
                                    context), // Open date picker on click
                              ),
                              border: OutlineInputBorder(),
                            ),
                          ),
                         
                        ),
                      ]),
                      const SizedBox(height: 16.0),
                      const Text(
                        'Shipment Type:',
                        style: TextStyle(
                          fontFamily: 'Public Sans',
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Color(0xFF212121),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      _buildShipmentType(),
                      const SizedBox(height: 16.0),
                      _buildBoxesWeightRow(),
                      const SizedBox(height: 16.0),
                      Row(
                        children: [
                          Icon(Icons.info_outline),
                          Text(
                            "  To obtain accurate rate for spot rate with guarenteed space and booking, please ensure your container count and weight per container is accurate.",
                            style: TextStyle(
                                fontFamily: 'PublicSans',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0XFF666666)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      Text("Container Internal Dimensions:",
                          style: TextStyle(
                              fontFamily: 'PublicSans',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0XFF212121))),
                      const SizedBox(height: 16.0),
                      Container(
                        height: 96,
                        width: 255,
                        child: Column(
                          children: [
                            specificationstext("Length", "39.46 ft"),
                            specificationstext("Width", "7.70 ft"),
                            specificationstext("Height", "7.84 ft"),
                            // Image(image: AssetImage("assets/container.jpg")),
                          ],
                        ),
                      
                        //SizedBox(width: 50),
                        // Image(image: AssetImage("assets/container.jpg")),
                      ),
                      const SizedBox(height: 16.0),
                      _buildElevatedIcon(),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Widget specificationstext(label, value) {
    return Row(
      children: [
        Container(
          width: 60,
          child: Text(label,
              style: TextStyle(
                  fontFamily: 'PublicSans',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0XFF666666))),
        ),

        SizedBox(width: 10),
        Text(
          value,
          style: TextStyle(
              fontFamily: 'PublicSans',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0XFF212121)),
        ),
        // SizedBox(width: 50),
        //Image(image: AssetImage("assets/container.jpg")),
      ],
    );
  }

  Widget _buildElevatedButton() {
    return ElevatedButton(
      onPressed: () {
        // Action on click
      },
      style: ButtonStyle(
        side: MaterialStateProperty.all(BorderSide(
          color: Color(0xFF0139FF),
        )),
        minimumSize: MaterialStateProperty.all(Size(122.0, 40.0)),
        backgroundColor: MaterialStateProperty.all(Color(0xFFE6EBFF)),
      ),
      child: Text(
        'History',
        style: TextStyle(color: Color(0xFF0139FF), fontFamily: "Public Sans"),
      ),
    );
  }

  Widget _buildElevatedIcon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton.icon(
          onPressed: () {
            // Action on click
          },
          icon: Icon(
            Icons.search, // Icon to display
            size: 18.0, // Icon size
            color: Color(0xFF0139FF), // Icon color
          ),
          style: ButtonStyle(
            side: MaterialStateProperty.all(BorderSide(
              color: Color(0xFF0139FF),
            )),
            minimumSize: MaterialStateProperty.all(Size(122.0, 40.0)),
            backgroundColor: MaterialStateProperty.all(Color(0xFFE6EBFF)),
          ),
          label: Text(
            'Search',
            style: TextStyle(color: Color(0xFF0139FF)),
          ),
        ),
      ],
    );
  }

  Widget _buildShipmentType() {
    return Row(
      children: [
        _buildCheckBox(
          "FCL",
          _isFCLSelected,
          (bool? value) {
            setState(() {
              _isFCLSelected = value ?? false;
            });
          },
        ),
        SizedBox(width: 24),
        _buildCheckBox(
          "LCL",
          _isLCLSelected,
          (bool? value) {
            setState(() {
              _isLCLSelected = value ?? false;
            });
          },
        ),
      ],
    );
  }

  Widget _buildPorts() {
    return Row(
      children: [
        _buildCheckBox(
          "Include nearby origin ports",
          _isOriginSelected,
          (bool? value) {
            setState(() {
              _isOriginSelected = value ?? false;
            });
          },
        ),
        SizedBox(width: 460),
        _buildCheckBox(
          "Include nearby destination ports",
          _isDestSelected,
          (bool? value) {
            setState(() {
              _isDestSelected = value ?? false;
            });
          },
        ),
      ],
    );
  }

  Widget _buildCheckBox(String label, bool? value, Function(bool?)? onChanged) {
    return Row(children: [
      Checkbox(
        value: value,
        // shape: RoundedRectangleBorder(
        //   side: BorderSide(
        //     color: Color(0xFFFFFFFF), // Outline color
        //   ),
        //   borderRadius: BorderRadius.zero,
        // ),
        activeColor: Color(0xFF155EEF),
        onChanged: onChanged,
      ),
      Text(
        label,
        style: TextStyle(
            fontFamily: 'PublicSans',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0XFF666666)),
      )
    ]);
  }

  Widget _buildOriginDestinationRow() {
    return Row(
      children: [
        Expanded(
            child:
                _build_textfield("Origin", Image.asset('assets/location.jpg'))),
        SizedBox(width: 24),
        Expanded(
            child: _build_textfield(
                "Destination", Image.asset('assets/location.jpg'))),
      ],
    );
  }

  Widget _buildBoxesWeightRow() {
    return Row(
      children: [
        _build_dropdown(),
        SizedBox(width: 24),
        Expanded(child: _build_textfield("No of Boxes", null)),
        SizedBox(width: 24),
        Expanded(child: _build_textfield("Weight (Kg)", null)),
      ],
    );
  }

  Widget _build_textfield(String label, Widget? icon) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
            fontFamily: 'PublicSans',
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0XFF9E9E9E)),
        prefixIcon: icon,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFFFFFFF), // Border color
            // width: 2.0, // Border width
          ),
        ),
      ),
    );
  }

  Widget _build_dropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 645.0,
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: 'Container Size',
              labelStyle: TextStyle(
                  fontFamily: 'PublicSans',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0XFF9E9E9E)),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFFFFFFFF), // Border color
                  // width: 2.0, // Border width
                ),
              ),
            ),
            value: selectedValue,
            items: items.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: TextStyle(
                      fontFamily: 'PublicSans',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0XFF9E9E9E)),
                ),
              );
            }).toList(),
            icon: Image.asset('assets/Vector.png', color: Color(0XFF707070)),
            onChanged: (String? newValue) {
              setState(() {
                selectedValue = newValue;
              });
            },
          ),
        ),
      ],
    );
  }
}
