import 'dart:convert';

import 'package:get/get.dart';
import 'package:hrapp/Model/PayrollModel.dart';
import 'package:hrapp/controller/LoginController.dart';
import 'package:http/http.dart' as http;

final Logincontroller loginController = Get.find<Logincontroller>();

class Payrollcontroller extends GetxController {
  @override
  void onInit() {
    Getpayroll();
    super.onInit();
  }

  var payrolllist = <Payrollmodel>[].obs;

  var payrolldetails = <payrollDetail>[].obs;

  RxString Year = "2024".obs;

  PayrollReponse payrollReponse = PayrollReponse();
  RxBool isloading = false.obs;

  Future<void> Getpayroll() async {
    isloading.value = true;
    try {
      int? empid = loginController.box.read("UserId");
      String url =
          "http://rshrmsapapi.redsecure.online/api/HRMSWEBAPI/payroll?empid=$empid&authcode=${loginController.box.read('AppCode')}";

      final reponse = await http.get(Uri.parse(url));

      if (reponse.statusCode == 200) {
        payrolllist.clear();

        final data = jsonDecode(reponse.body);

        payrollReponse.iserror = data["iserror"];
        payrollReponse.errorMsg = data["errorMsg"];

        final List pay = data["SalarySlip"];

        for (int i = 0; i < pay.length; i++) {
          Payrollmodel payrollmodel = Payrollmodel();

          payrollmodel.id = pay[i]["id"];
          payrollmodel.Empid = pay[i]["EmpId"];
          payrollmodel.empname = pay[i]["EmpName"];
          payrollmodel.dmonth = pay[i]["D_Month"];
          payrollmodel.processingYear = pay[i]["ProcessingYear"];
          payrollmodel.netSalary = pay[i]["NetSalary"];
          payrollmodel.payslipfile = pay[i]["payslipfile"];

          payrollmodel.payrolldetails = payrolldetails;

          payrolllist.add(payrollmodel);

          final payroll1 = pay[i]["payrollDetail"];

          payrolldetails.clear();

          for (int j = 0; j < payroll1.length; j++) {
            payrollDetail payrolldetail = payrollDetail();

            payrolldetail.paytype = payroll1[j]["Paytype"];
            payrolldetail.amount = payroll1[j]["Amount"];
            payrolldetail.isallowance = payroll1[j]["isallowance"];

            payrolldetails.add(payrolldetail);
          }

          print(payrollmodel.id.toString());
        }
      }
    } catch (ex) {
      print(ex.toString());
    }
    isloading.value = false;
  }
}
