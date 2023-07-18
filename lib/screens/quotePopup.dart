// ignore_for_file: prefer_const_constructors, must_be_immutable, sized_box_for_whitespace, file_names

import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import '../Model/quoteOrder.dart';

class QuotePopup extends StatefulWidget {
  List? orderDetails;
  QuoteOrders? orderData;
  DateTime? postedDate;

  QuotePopup({super.key, this.orderData});

  @override
  State<QuotePopup> createState() => _QuotePopupState();
}

class _QuotePopupState extends State<QuotePopup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TimelineTile(
              axis: TimelineAxis.vertical,
              indicatorStyle: IndicatorStyle(
                color: Colors.amber,
                height: 50,
                width: 50,
                iconStyle: widget.orderData!.posted ?? false
                    ? IconStyle(color: Colors.white, iconData: Icons.check)
                    : IconStyle(color: Colors.white, iconData: Icons.circle),
              ),
              isFirst: true,
              afterLineStyle: LineStyle(color: Colors.blue),
              alignment: TimelineAlign.manual,
              lineXY: 0.15,
              endChild: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30, bottom: 30),
                    height: 60,
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 8, top: 8),
                          child: Text(
                            'Quote Recieved',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8, bottom: 5),
                          child: Text(
                            '${widget.orderData!.postedDate}',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            TimelineTile(
              axis: TimelineAxis.vertical,
              indicatorStyle: IndicatorStyle(
                color: Colors.green,
                height: 50,
                width: 50,
                iconStyle: widget.orderData!.posted ?? false
                    ? IconStyle(color: Colors.white, iconData: Icons.check)
                    : IconStyle(color: Colors.white, iconData: Icons.circle),
              ),
              isLast: true,
              beforeLineStyle: LineStyle(color: Colors.blue),
              alignment: TimelineAlign.manual,
              lineXY: 0.15,
              endChild: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30, bottom: 30),
                    height: 60,
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 8, top: 20),
                          child: Text(
                            'Converted',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
