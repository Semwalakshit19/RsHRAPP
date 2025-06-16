import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:get/get_core/src/get_main.dart';
import 'package:hrapp/Model/Approval_detailsModl.dart';
import 'package:hrapp/Model/UpdateLeaveApproveModel.dart';
import 'package:hrapp/Widget/TimeWid.dart';
import 'package:hrapp/common/ccustomappbar.dart';
import 'package:hrapp/controller/AddJustLeaveontroller.dart';
import 'package:hrapp/controller/ApprovalDetailsController.dart';
import 'package:hrapp/controller/Profilecontroller.dart';
import 'package:hrapp/controller/SetWorkFlow.dart';
import 'package:hrapp/controller/TimeLineController.dart';
import 'package:hrapp/controller/UpdateLeaveApprove.dart';
import 'package:hrapp/view/navbar.dart';
import 'package:hrapp/view/pages/Dashboard.dart';
import 'package:intl/intl.dart';

class Viewdetailsscreen extends StatefulWidget {
  Viewdetailsscreen({super.key, required this.approvalDetails});

  final ApprovalDetails approvalDetails;

  @override
  State<Viewdetailsscreen> createState() => _ViewdetailsscreenState();
}

class _ViewdetailsscreenState extends State<Viewdetailsscreen> {
  Updateleaveapprove updateleaveapprove = Get.put(Updateleaveapprove());

  Updateleaveapprovemodel updateleaveapprovemodel = Updateleaveapprovemodel();

  Approvaldetailscontroller approvaldetailscontroller =
      Get.put(Approvaldetailscontroller());
  Timelinecontroller timelinecontroller1 = Get.put(Timelinecontroller());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    timelinecontroller1.getTimeline(
        widget.approvalDetails.screenID, widget.approvalDetails.recordID);
  }

  Widget build(BuildContext context) {
    String date1 = widget.approvalDetails.approvalLeaveModel!.toDate.toString();
    DateTime dateTime1 = DateTime.parse(date1);

    String todate = DateFormat('d MMM yyyy').format(dateTime1);

    String date =
        widget.approvalDetails.approvalLeaveModel!.fromDate.toString();
    DateTime dateTime = DateTime.parse(date);

    String formdate = DateFormat('d MMM yyyy').format(dateTime);
    Setworkflow setworkflow = Get.put(Setworkflow());

    addjustleavecontroller addjustleave = Get.put(addjustleavecontroller());
    Profilecontroller profilecontroller = Get.put(Profilecontroller());
    String? newtodate;

    String? to;

    if (todate == "1 jan 0001") {
      newtodate = ""; // You don't need to assign todate again
      to = "";
    } else {
      newtodate = todate;
      to = "-";
    }

    String? status;
    if (widget.approvalDetails.approvalLeaveModel!.remarks == null) {
      status = '';
    } else {
      status = widget.approvalDetails.remarks;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("View Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    child: Text(
                      "Employee Name",
                      style: TextStyle(color: Colors.grey[500], fontSize: 12),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    child: SizedBox(
                      width: 150.w,
                      child: Text(
                        "${widget.approvalDetails.approvalLeaveModel!.employeeName}",
                        overflow: TextOverflow.clip,
                        softWrap: true,
                        style: TextStyle(fontSize: 16),
                        maxLines: 2,
                        textScaler: TextScaler.noScaling,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Leave Type",
                          style:
                              TextStyle(color: Colors.grey[500], fontSize: 12),
                        ),
                        Text(
                          "Leave Days",
                          style:
                              TextStyle(color: Colors.grey[500], fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${widget.approvalDetails.approvalLeaveModel!.leave_Type}",
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          "${widget.approvalDetails.approvalLeaveModel!.leaveDays}",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "From Date",
                          style:
                              TextStyle(color: Colors.grey[500], fontSize: 12),
                        ),
                        // SizedBox(
                        //   width: 10.w,
                        // ),
                        Text(
                          "To Date",
                          style:
                              TextStyle(color: Colors.grey[500], fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          formdate,
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          todate == '1 Jan 0001' ? '' : '$newtodate',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(
                  //     left: 10,
                  //     right: 10,
                  //   ),
                  //   child: Text(
                  //     "Remarks",
                  //     style: TextStyle(color: Colors.grey[500], fontSize: 12),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 5.h,
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.only(
                  //     left: 10,
                  //     right: 10,
                  //   ),
                  //   child: Container(
                  //     width: MediaQuery.of(context).size.width,
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(8),
                  //         border: Border.all(color: Colors.grey, width: 0.5)),
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(8.0),
                  //       child: Text(
                  //         status!,
                  //         style: TextStyle(fontSize: 12),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                ],
              ),
              SizedBox(
                height: 150.h,
              ),
              Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                        ),
                        child: Text("Comment * ",
                            style: TextStyle(
                                color: Colors.grey[500], fontSize: 12)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          // onTap: _fromDate,
                          controller: setworkflow.Comment,
                          // controller: halfday.fromdatecontroller,
                          // controller: Addfulldayleave.fromdatecontroller,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            // label: const Text("From date"),
                          ),
                          // validator: (Value) {
                          //   if (Value == null || Value.isEmpty) {
                          //     return "Please enter the date";
                          //   }
                          //   return null;
                          // },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton.icon(
                            style: ButtonStyle(
                                backgroundColor:
                                    WidgetStatePropertyAll(Colors.red)),
                            onPressed: () {
                              // approvaldetailscontroller.GetApprovaldetails();

                              if (setworkflow.Comment.text.isEmpty) {
                                Get.snackbar("Comments ", "Enter Any message");
                              } else {
                                setworkflow.SetWorkFlow(
                                    widget.approvalDetails.id!,
                                    widget.approvalDetails.recordID!,
                                    "Rejected");

                                addjustleave.addjustleave(
                                    widget.approvalDetails.approvalLeaveModel!
                                        .leaveRequestID,
                                    'Item Rejected');

                                Get.snackbar(
                                  'Action Cancelled', // Title
                                  'Your request has been rejected.', // Message
                                  icon: Icon(Icons.warning_amber_rounded,
                                      color: Colors.white),
                                  backgroundColor: Colors.red,
                                  snackPosition: SnackPosition.bottom,
                                  borderRadius: 8,
                                  margin: EdgeInsets.all(10),
                                  borderColor: Colors.white,
                                  borderWidth: 1,
                                  colorText: Colors.white,
                                  // messageText: Text(
                                  //   'Your request has been rejected.',
                                  //   style: TextStyle(
                                  //       fontSize: 16,
                                  //       fontWeight: FontWeight.w500),
                                  // ),
                                  duration: Duration(seconds: 3),
                                  animationDuration:
                                      Duration(milliseconds: 300),
                                  boxShadows: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 8,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                );
                                // approvaldetailscontroller.GetApprovaldetails();

                                Get.offAll(() => Navbar());
                              }
                            },
                            label: Text(
                              "Reject",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            icon: Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                          ),
                          TextButton.icon(
                            style: ButtonStyle(
                                backgroundColor:
                                    WidgetStatePropertyAll(Colors.green)),
                            onPressed: () {
                              // approvaldetailscontroller.GetApprovaldetails();

                              if (setworkflow.Comment.text.isEmpty) {
                                Get.snackbar("Comments ", "Enter Any message");
                              } else {
                                setworkflow.SetWorkFlow(
                                    widget.approvalDetails.id!,
                                    widget.approvalDetails.recordID!,
                                    "Approved");

                                addjustleave.addjustleave(
                                    widget.approvalDetails.approvalLeaveModel!
                                        .leaveRequestID,
                                    'Item Approved');

                                Get.snackbar(
                                  'Action Approved', // Title
                                  'Your request has been Approved.', // Message
                                  icon: Icon(Icons.warning_amber_rounded,
                                      color: Colors.white),
                                  backgroundColor: Colors.green,
                                  snackPosition: SnackPosition.bottom,
                                  borderRadius: 8,
                                  margin: EdgeInsets.all(10),
                                  borderColor: Colors.white,
                                  borderWidth: 1,
                                  colorText: Colors.white,
                                  // messageText: Text(
                                  //   'Your request has been rejected.',
                                  //   style: TextStyle(
                                  //       fontSize: 16,
                                  //       fontWeight: FontWeight.w500),
                                  // ),
                                  duration: Duration(seconds: 3),
                                  animationDuration:
                                      Duration(milliseconds: 300),
                                  boxShadows: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 8,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                );
                                // approvaldetailscontroller.GetApprovaldetails();

                                Get.offAll(() => Navbar());
                              }
                            },
                            label: Text(
                              "Approve",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            icon: Icon(
                              Icons.check_circle,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // TimeWid(
              //   imageUrl: '',
              //   isFirst: true,
              //   isLast: false,
              // ),
              // TimeWid(
              //   imageUrl: '',
              //   isFirst: false,
              //   isLast: true,
              // ),
              TimeWid(
                text: '',
                images:
                    'http://hrdemo.rs-apps.online/EmployeeDocument/${profilecontroller.profilemodel.userimage}',
              ),
              // TimeWid(
              //   text: '',
              //   images:
              //       'http://hrdemo.rs-apps.online/EmployeeDocument/${profilecontroller.profilemodel.userimage}',
              // )
            ],
          ),
        ),
      ),
    );
  }
}
