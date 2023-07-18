// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, non_constant_identifier_names, must_be_immutable, use_key_in_widget_constructors, file_names

import 'dart:convert';
import 'dart:typed_data';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sales_order/screens/orderPopup.dart';
import 'package:sales_order/screens/returnItems.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Model/orderReport.dart';
import 'package:sales_order/Model/custormerorder.dart';
import 'package:share_plus/share_plus.dart';

class OrderDetails extends StatefulWidget {
  String? orderNumber;
  dynamic total;
  dynamic orderDate;
  List? orderDetails;
  String? paymentMethodId;
  double? subtotal;
  double? taxAmount;
  double? discountAmount;
  bool? posted;
  DateTime? postedDate;
  bool? picked;
  bool? invoiced;
  Datum? orderData;
  Data? orderCrt;
  String? statusOrder;

  OrderDetails({
    this.orderNumber,
    this.total,
    this.orderDate,
    this.orderDetails,
    this.paymentMethodId,
    this.subtotal,
    this.taxAmount,
    this.discountAmount,
    this.posted,
    this.postedDate,
    this.picked,
    this.invoiced,
    this.orderData,
    this.orderCrt,
    this.statusOrder,
  });

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  var value = NumberFormat('#,##0.00');

  String customerName = "";
  dynamic customerAddress1;
  dynamic customerAddress2;
  dynamic customerAddress3;
  dynamic customerCity;
  dynamic customerState;
  dynamic customerCountry;
  String? customerPhone;
  bool? invoiced;
  bool? picked;
  double? total;


  late final SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    getStringValuesSF();
  }

  getStringValuesSF() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      customerName = _prefs.getString('customerName') ?? "";
      customerAddress1 = _prefs.getString('customerAddress1') ?? "";
      customerAddress2 = _prefs.getString('customerAddress2') ?? "";
      customerAddress3 = _prefs.getString('customerAddress3') ?? "";
      customerCity = _prefs.getString('customerCity') ?? "";
      customerState = _prefs.getString('customerState') ?? "";
      customerCountry = _prefs.getString('customerCountry') ?? "";
      customerPhone = _prefs.getString('customerPhone') ?? "";
      
     
      // invoiced = _prefs.getBool('invoiced');
      // picked = _prefs.getBool('picked');
      // total = _prefs.getDouble('total');
    });
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Center(child: Text('Order Details')),
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 10,
                  right: 10,
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: Text(
                        'General info',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Text(
                        'Order ID',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      trailing: Text(
                        '${widget.orderNumber}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Text(
                        'Order Date ',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      trailing: Padding(
                        padding: const EdgeInsets.only(left: 25.0),
                        child: Text(
                          '${widget.orderDate}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Text(
                        'Status',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      trailing: SizedBox(
                        width: 170,
                        child: SizedBox(
                          height: 30,
                          child: TextFormField(
                            readOnly: true,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(left: 20, right: 5),
                              filled: true,
                              fillColor: Colors.orange[50],
                              border: OutlineInputBorder(),
                              hintText: '${widget.statusOrder}',
                              hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 100,
                      color: Colors.grey[100],
                      child: Row(
                        children: [
                          SizedBox(
                            height: 45,
                            child: ElevatedButton(
                              onPressed: () {
                                final box =
                                    context.findRenderObject() as RenderBox?;
                                OrderReportApi(box);
                              },
                              child: Text('Print Order Details'),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 45,
                                width: 150,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green),
                                  onPressed: () {
                                    showModalBottomSheet<void>(
                                      context: context,
                                      builder: (context) => SizedBox(
                                        height: 400,
                                        child:
                                            _popupOrderPopup(widget.orderData!),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    ' View Status ',
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                height: 45,
                                width: 150,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red),
                                  onPressed: () {
                                    if (widget.orderData!.invoiced == true) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ReturnItems(
                                            orderData: widget.orderData,
                                          ),
                                        ),
                                      );
                                    } else {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: const Text(
                                                'Unable to return. Order has not been invoiced'),
                                            actions: <Widget>[
                                              TextButton(
                                                child: const Text('Ok'),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }
                                  },
                                  child: Text(
                                    'Return Items',
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    ListTile(
                      leading: Text(
                        'Shipping details',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: Text(
                              "Name",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Flexible(
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                customerName,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                                textWidthBasis: TextWidthBasis.longestLine,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListTile(
                      leading: Text(
                        'Phone ',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      trailing: Text(
                        "$customerPhone",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: Text(
                              "Address",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Flexible(
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                '$customerAddress1'
                                ','
                                ' '
                                '$customerAddress2'
                                ','
                                ' '
                                '$customerCity'
                                ','
                                ' '
                                '$customerState '
                                ','
                                ' '
                                '$customerCountry'
                                '.',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                                textWidthBasis: TextWidthBasis.longestLine,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ListTile(
                      leading: Text(
                        'Items In your order',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: widget.orderDetails!.length,
                        itemBuilder: (context, index) {
                          // ignore: unused_local_variable
                          String? formattedDate;
                          return Card(
                            elevation: 2,
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Image.asset(
                                  'lib/images/cart.jpg',
                                ),
                              ),
                              title: Text(
                                widget.orderDetails![index].itemId,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Text(
                                  widget.orderDetails![index].orderQty
                                      .toString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              trailing: Column(
                                children: [
                                  Text(
                                    formattedDate = DateFormat('yyyy-MM-dd')
                                        .format(widget
                                            .orderDetails![index].invoicedDate),
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      '₦${value.format(widget.orderDetails?[index].total)}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                    SizedBox(
                      height: 30,
                    ),
                    ListTile(
                      leading: Text(
                        'Payment Info',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Text(
                        'Payment method',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: Text(
                        '${widget.paymentMethodId}',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.only(left: 30, right: 30),
                      leading: Text(
                        'Subtotal',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      trailing: Text(
                        '₦${value.format(widget.subtotal)}',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.only(left: 30, right: 30),
                      leading: Text(
                        'Discount',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      trailing: Text(
                        '₦${value.format(widget.discountAmount)}',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.only(left: 30, right: 30),
                      leading: Text(
                        'Shipping Fee',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      trailing: Text(
                        '₦${value.format(000)}',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.only(left: 30, right: 30),
                      leading: Text(
                        'Tax',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      trailing: Text(
                        '₦${value.format(widget.taxAmount)}',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.only(left: 30, right: 30),
                      leading: Text(
                        'Total',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      trailing: Text(
                        '₦${value.format(widget.total)}',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  OrderPopup _popupOrderPopup(Datum orderData) => OrderPopup(
        orderData: orderData,
      );

     String? token;

  void OrderReportApi(RenderBox? box) async {
    
     token = _prefs.getString('token');
    // ignore: use_build_context_synchronously
    showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        });
    final response = await http.get(
        Uri.parse(
            'https://powersoftrd.com/PEMAPI/api/GetOrderReportById/741258?Id=${widget.orderNumber}'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        });
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      var orderReport = OrderReport.fromJson(result);
      orderReport.data!.fileContents;
      // ignore: unused_local_variable
      final shareResult = await Share.shareXFiles(
        [
          XFile.fromData(
            Uint8List.fromList(
                base64.decode(orderReport.data!.fileContents ?? '')),
            name: 'order-${widget.orderNumber}',
            mimeType: orderReport.data!.contentType ?? 'application/pdf',
          ),
        ],
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
      );

      // scaffoldMessenger.showSnackBar(getResultSnackBar(shareResult));
    } else {
      throw Exception('Failed to load data');
    }
  }
}
