import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:taskes/class/puplicvarible.dart';
import 'package:taskes/constant/routscreen/routimge.dart';
import 'package:taskes/function/formatAny.dart';
import 'package:taskes/onlonfile/functionserver.dart';
import 'package:taskes/onlonfile/statusRequst.dart';
import 'package:taskes/report/pdfclass/pdfclass.dart';
import 'package:taskes/report/pdfclass/pdfenum.dart';
import 'package:arabic_reshaper/arabic_reshaper.dart';

class Homecontroller extends GetxController {
  var expandedStates = <String, bool>{}.obs;
  RxBool isExpanded = false.obs;

  void toggleExpansion(String id) {
    expandedStates[id] = !(expandedStates[id] ?? false);
    update();
  }

  // ================= UI contrller ===================
  RxInt stastScreen = 1.obs;
  // ==================================================
  late Statusrequst statusrequst;
  Functionserver funserver = Functionserver(Get.find());

  @override
  void onInit() {
    namcpany = TextEditingController();
    phoneman = TextEditingController();
    addressc = TextEditingController();
    namemang = TextEditingController();
    sercnamcpany = TextEditingController();
    comsent = TextEditingController();
    casstac = TextEditingController();
    dateaco = TextEditingController();
    drivnam = TextEditingController();
    noteaco = TextEditingController();
    numbcar = TextEditingController();
    numbrme = TextEditingController();
    subjcar = TextEditingController();
    typcare = TextEditingController();
    paidcost = TextEditingController();
    paiddate = TextEditingController();
    paidnott = TextEditingController();
    blancount = TextEditingController();
    blancdatt = TextEditingController();
    blancnoot = TextEditingController();
    blancditl = TextEditingController();
    a1 = TextEditingController();
    a2 = TextEditingController();
    a3 = TextEditingController();
    a4 = TextEditingController();
    a5 = TextEditingController();
    a6 = TextEditingController();
    a7 = TextEditingController();
    a8 = TextEditingController();
    a9 = TextEditingController();
    noote = TextEditingController();
    rblce = TextEditingController();
    acountmo = TextEditingController();
    movet = TextEditingController();
    firstDate = TextEditingController();
    endDate = TextEditingController();
    loadcompany();
    loadBlance();
    super.onInit();
  }

  //==================== company Informatiom ====================
  String? selectedType = '1';
  bool ins = false;
  RxString curntidcom = "0".obs;
  RxInt idcompselect = 0.obs;
  RxBool isEdite = false.obs;
  RxString selctnamecomp = ''.obs;
  RxString selctadrrcomp = ''.obs;
  RxString selctnphocomp = ''.obs;
  RxString selctmangcomp = ''.obs;
  TextEditingController namcpany = TextEditingController();
  TextEditingController sercnamcpany = TextEditingController();
  TextEditingController phoneman = TextEditingController();
  TextEditingController addressc = TextEditingController();
  TextEditingController namemang = TextEditingController();

  List companynma = [];
  void changeType(String? val) {
    selectedType = val;
    update();
  }

  Future<void> insertcompany() async {
    if (namcpany.text.isEmpty) {
      Get.snackbar('تنبيه', 'يرجى إدخال اسم الشركة');
      return;
    }
    statusrequst = Statusrequst.loading;
    try {
      var response = await funserver.isnComp(
        namcpany.text,
        phoneman.text,
        addressc.text,
        namemang.text,
        selectedType!,
      );
      ins = true;
      if (response != null && response['status'] == "success") {
        statusrequst = Statusrequst.success;
        loadcompany();
      } else {
        statusrequst = Statusrequst.failure;
      }
    } catch (e) {
      statusrequst = Statusrequst.failure;
      // print("Exception Error: $e");
    }
    update();
  }

  Future<void> updatCompany(String idcom) async {
    if (namcpany.text.isEmpty) {
      Get.snackbar('تنبيه', 'يرجى إدخال اسم الشركة');
      return;
    }
    statusrequst = Statusrequst.loading;
    try {
      var response = await funserver.updatComp(
        namcpany.text,
        phoneman.text,
        addressc.text,
        namemang.text,
        idcom,
      );
      ins = true;
      if (response != null && response['status'] == "success") {
        statusrequst = Statusrequst.success;
        namcpany.clear();
        phoneman.clear();
        addressc.clear();
        namemang.clear();
        Get.back();
        loadcompany();
      } else {
        statusrequst = Statusrequst.failure;
      }
    } catch (e) {
      statusrequst = Statusrequst.failure;
      // print("Exception Error: $e");
    }
    isEdite.value = false;
    update();
  }

  loadcompany() async {
    companynma.clear();
    statusrequst = Statusrequst.loading;
    update();
    try {
      var response = await funserver.lodcomp();
      if (response['status'] == "success") {
        companynma.addAll(response['data']);
        // print(response);
      } else {
        statusrequst = Statusrequst.failure;
      }
    } catch (e) {
      statusrequst = Statusrequst.failure;
      // print("Error in selectacoun: $e");
    }
    // await changeDigits();
    // sumformat();
    update();
  }

  serchcomp() async {
    companynma.clear();
    statusrequst = Statusrequst.loading;
    update();
    try {
      var response = await funserver.serchcomp(sercnamcpany.text);
      if (response['status'] == "success") {
        // print(response);
        companynma.addAll(response['data']);
        // print(response);
      } else {
        statusrequst = Statusrequst.failure;
      }
    } catch (e) {
      statusrequst = Statusrequst.failure;
      // print("Error in selectacoun: $e");
    }
    // await changeDigits();
    // sumformat();
    update();
  }

  deletcomp(String idcom) async {
    statusrequst = Statusrequst.loading;
    update();
    try {
      var response = await funserver.deltcompInf(idcom);
      if (response['status'] == "success") {
      } else {
        statusrequst = Statusrequst.failure;
      }
    } catch (e) {
      statusrequst = Statusrequst.failure;
      // print("Error in selectacoun: $e");
    }
    loadcompany();
    companyPaidd.clear();
    companyacount.clear();
    _resetToZero();
    selctnamecomp.value = '';
    selctadrrcomp.value = '';
    selctnphocomp.value = '';
    selctmangcomp.value = '';
    update();
  }

  //======================= Acount Company =======================
  List companyacount = [];
  List companyPaidd = [];
  bool loadingAcoutnt = false;
  String? idexAcou = '1';
  String? idexPaid = '1';
  RxDouble mysumcast = 0.0.obs;
  RxDouble myreblace = 0.0.obs;
  RxDouble myfinal = 0.0.obs;
  RxString mov1 = "0".obs,
      mov2 = "0".obs,
      paid1 = "0".obs,
      paid2 = "0".obs,
      total1 = "0".obs,
      total2 = "0".obs;
  double total = 0, totall = 0;
  late TextEditingController comsent = TextEditingController();
  late TextEditingController noote = TextEditingController();
  late TextEditingController casstac = TextEditingController();
  late TextEditingController dateaco = TextEditingController();
  late TextEditingController drivnam = TextEditingController();
  late TextEditingController noteaco = TextEditingController();
  late TextEditingController numbcar = TextEditingController();
  late TextEditingController numbrme = TextEditingController();
  late TextEditingController subjcar = TextEditingController();
  late TextEditingController typcare = TextEditingController();
  late TextEditingController paidcost = TextEditingController();
  late TextEditingController paiddate = TextEditingController();
  late TextEditingController paidnott = TextEditingController();
  late TextEditingController firstDate = TextEditingController();
  late TextEditingController endDate = TextEditingController();
  late TextEditingController a1 = TextEditingController();
  late TextEditingController a2 = TextEditingController();
  late TextEditingController a3 = TextEditingController();
  late TextEditingController a4 = TextEditingController();
  late TextEditingController a5 = TextEditingController();
  late TextEditingController a6 = TextEditingController();
  late TextEditingController a7 = TextEditingController();
  late TextEditingController a8 = TextEditingController();
  late TextEditingController a9 = TextEditingController();
  late TextEditingController rblce = TextEditingController();
  late TextEditingController acountmo = TextEditingController();
  late TextEditingController movet = TextEditingController();
  void changeIdexacou(String? val) {
    idexAcou = val;
    update();
  }

  void sumcast() {
    double parseField(String text) {
      return double.tryParse(text.trim()) ?? 0.0;
    }

    double mycast =
        parseField(a1.text) +
        parseField(a2.text) +
        parseField(a3.text) +
        parseField(a4.text) +
        parseField(a5.text) +
        parseField(a6.text) +
        parseField(a7.text) +
        parseField(a8.text) +
        parseField(acountmo.text) +
        parseField(a9.text);
    mysumcast.value = mycast;
    myreblace.value = parseField(rblce.text);
    myfinal.value = mysumcast.value - myreblace.value;
  }

  // late TextEditingController paiddate = TextEditingController();

  loadacount() async {
    expandedStates.clear();
    loadingAcoutnt = true;
    companyacount.clear();
    statusrequst = Statusrequst.loading;
    update();
    try {
      var response = await funserver.lodcoacount(idcompselect.value.toString());
      if (response['status'] == "success") {
        companyacount.addAll(response['data']);
        loadingAcoutnt = false;
        // print(response);
      } else {
        statusrequst = Statusrequst.failure;
      }
    } catch (e) {
      statusrequst = Statusrequst.failure;
      // print("Error in selectacoun: $e");
    } finally {
      // هذه أهم نقطة: التوقف عن التحميل مهما كانت النتيجة
      loadingAcoutnt = false;
      summation();
      loadaPaid();
      update();
    }
    update();
  }

  loadacTowDate() async {
    expandedStates.clear();
    loadingAcoutnt = true;
    companyacount.clear();
    statusrequst = Statusrequst.loading;
    update();
    try {
      var response = await funserver.lodcoToDate(
        idcompselect.value.toString(),
        firstDate.text,
        endDate.text,
      );
      if (response['status'] == "success") {
        companyacount.addAll(response['data']);
        loadingAcoutnt = false;
      } else {
        statusrequst = Statusrequst.failure;
      }
    } catch (e) {
      statusrequst = Statusrequst.failure;
      // print("Error in selectacoun: $e");
    } finally {
      // هذه أهم نقطة: التوقف عن التحميل مهما كانت النتيجة
      loadingAcoutnt = false;
      summationTodate();
      loadaPaidTodate();
      update();
    }
    update();
  }

  void closse() {
    idcompselect.value = 0;
    loadacount();
    selctnamecomp.value = '';
    selctadrrcomp.value = '';
    selctnphocomp.value = '';
    selctmangcomp.value = '';
  }

  Future<void> insertacvoMov() async {
    if (mysumcast.value == 0.0) {
      Get.snackbar('تنبيه', 'يرجى إدخال مبلغ اولاً');
      return;
    }
    statusrequst = Statusrequst.loading;
    try {
      var response = await funserver.isnMovacou(
        comsent.text,
        myfinal.value.toString(),
        a1.text,
        a2.text,
        a3.text,
        a4.text,
        a5.text,
        a6.text,
        a7.text,
        a8.text,
        a9.text,
        dateaco.text,
        '$idcompselect',
        '$idexAcou',
        '${Puplicvarible.iduser}',
        drivnam.text,
        noteaco.text,
        numbcar.text,
        numbrme.text,
        subjcar.text,
        typcare.text,
        movet.text,
        acountmo.text,
        myreblace.value.toString(),
      );
      if (response != null && response['status'] == "success") {
        statusrequst = Statusrequst.success;
        loadacount();
        comsent.clear();
        casstac.clear();
        drivnam.clear();
        noteaco.clear();
        numbcar.clear();
        numbrme.clear();
        subjcar.clear();
        typcare.clear();
        a1.clear();
        a2.clear();
        a3.clear();
        a4.clear();
        a5.clear();
        a6.clear();
        a7.clear();
        a8.clear();
        a9.clear();
        Get.back();
        update();
      } else {
        statusrequst = Statusrequst.failure;
      }
    } catch (e) {
      statusrequst = Statusrequst.failure;
      // print("Exception Error: $e");
    }
    update();
  }

  deletAcount(String idmov) async {
    statusrequst = Statusrequst.loading;
    update();
    try {
      var response = await funserver.deltAcount(idmov);
      if (response['status'] == "success") {
      } else {
        statusrequst = Statusrequst.failure;
      }
    } catch (e) {
      statusrequst = Statusrequst.failure;
      // print("Error in selectacoun: $e");
    }
    loadacount();
    update();
  }

  loadaPaid() async {
    // loadingAcoutnt = true;
    companyPaidd.clear();
    statusrequst = Statusrequst.loading;
    update();
    try {
      var response = await funserver.lodcoPaid(idcompselect.value.toString());
      if (response['status'] == "success") {
        companyPaidd.addAll(response['data']);
        // summation();
        // loadingAcoutnt = false;
        // print(response);
      } else {
        statusrequst = Statusrequst.failure;
      }
    } catch (e) {
      statusrequst = Statusrequst.failure;
      // print("Error in selectacoun: $e");
    } finally {
      // هذه أهم نقطة: التوقف عن التحميل مهما كانت النتيجة
      // loadingAcoutnt = false;
      // loadacount();
      update();
    }
    update();
  }

  loadaPaidTodate() async {
    // loadingAcoutnt = true;
    companyPaidd.clear();
    statusrequst = Statusrequst.loading;
    update();
    try {
      var response = await funserver.lodcoPaidTodate(
        idcompselect.value.toString(),
        firstDate.text,
        endDate.text,
      );
      if (response['status'] == "success") {
        companyPaidd.addAll(response['data']);
      } else {
        statusrequst = Statusrequst.failure;
      }
    } catch (e) {
      statusrequst = Statusrequst.failure;
      // print("Error in selectacoun: $e");
    } finally {
      update();
    }
    update();
  }

  Future<void> insertPaid() async {
    if (paidcost.text.isEmpty) {
      Get.snackbar('تنبيه', 'يرجى إدخال مبلغ اولاً');
      return;
    }
    statusrequst = Statusrequst.loading;
    try {
      var response = await funserver.paidins(
        paidcost.text,
        paiddate.text,
        '$idcompselect',
        '$idexPaid',
        '${Puplicvarible.iduser}',
        paidnott.text,
      );
      if (response != null && response['status'] == "success") {
        statusrequst = Statusrequst.success;
        // print(response);
        loadacount();
        paidcost.clear();
        paidnott.clear();
        Get.back();
        loadaPaid();
        update();
      } else {
        statusrequst = Statusrequst.failure;
      }
    } catch (e) {
      statusrequst = Statusrequst.failure;
      // print("Exception Error: $e");
    }
    update();
  }

  summation() async {
    statusrequst = Statusrequst.loading;
    _resetToZero();
    update();
    try {
      var response = await funserver.summtion(idcompselect.value.toString());
      if (response != null &&
          response['status'] == "success" &&
          response['data'] != null) {
        var responseBody = response['data'];
        // print(responseBody);
        double vM1 =
            double.tryParse(responseBody['total_mov_1']?.toString() ?? "0") ??
            0;
        double vP1 =
            double.tryParse(responseBody['total_paid_1']?.toString() ?? "0") ??
            0;
        double vM2 =
            double.tryParse(responseBody['total_mov_2']?.toString() ?? "0") ??
            0;
        double vP2 =
            double.tryParse(responseBody['total_paid_2']?.toString() ?? "0") ??
            0;
        mov1.value = vM1.toString();
        paid1.value = vP1.toString();
        total1.value = (vM1 - vP1).toString();

        mov2.value = vM2.toString();
        paid2.value = vP2.toString();
        total2.value = (vM2 - vP2).toString();

        statusrequst = Statusrequst.success;
      } else {
        _resetToZero();
        statusrequst = Statusrequst.success;
      }
    } catch (e) {
      _resetToZero();
      statusrequst = Statusrequst.failure;
    } finally {
      update();
    }
  }

  summationTodate() async {
    statusrequst = Statusrequst.loading;
    _resetToZero();
    update();
    try {
      var response = await funserver.summtionToldate(
        idcompselect.value.toString(),
        firstDate.text,
        endDate.text,
      );
      if (response != null &&
          response['status'] == "success" &&
          response['data'] != null) {
        var responseBody = response['data'];
        // print(responseBody);
        double vM1 =
            double.tryParse(responseBody['total_mov_1']?.toString() ?? "0") ??
            0;
        double vP1 =
            double.tryParse(responseBody['total_paid_1']?.toString() ?? "0") ??
            0;
        double vM2 =
            double.tryParse(responseBody['total_mov_2']?.toString() ?? "0") ??
            0;
        double vP2 =
            double.tryParse(responseBody['total_paid_2']?.toString() ?? "0") ??
            0;
        mov1.value = vM1.toString();
        paid1.value = vP1.toString();
        total1.value = (vM1 - vP1).toString();

        mov2.value = vM2.toString();
        paid2.value = vP2.toString();
        total2.value = (vM2 - vP2).toString();

        statusrequst = Statusrequst.success;
      } else {
        _resetToZero();
        statusrequst = Statusrequst.success;
      }
    } catch (e) {
      _resetToZero();
      statusrequst = Statusrequst.failure;
    } finally {
      update();
    }
  }

  void _resetToZero() {
    mov1.value = "0";
    paid1.value = "0";
    total1.value = "0";
    mov2.value = "0";
    paid2.value = "0";
    total2.value = "0";
  }

  deletPaid(String idpush) async {
    statusrequst = Statusrequst.loading;
    update();
    try {
      var response = await funserver.deltpaid(idpush);
      if (response['status'] == "success") {
        Get.back();
      } else {
        statusrequst = Statusrequst.failure;
      }
    } catch (e) {
      statusrequst = Statusrequst.failure;
      // print("Error in selectacoun: $e");
    }
    loadacount();
    update();
  }

  //============================= Blans ==============================
  RxDouble blans1 = 0.0.obs, blans2 = 0.0.obs;
  late TextEditingController blancount = TextEditingController();
  late TextEditingController blancdatt = TextEditingController();
  late TextEditingController blancnoot = TextEditingController();
  late TextEditingController blancditl = TextEditingController();
  double blinD = 0, blOuD = 0, blFD = 0, blinUs = 0, blOUs = 0, blFU = 0;
  RxString blinDs = '0'.obs,
      blOuDs = '0'.obs,
      blFDs = '0'.obs,
      blinUss = '0'.obs,
      blOUss = '0'.obs,
      blFUs = '0'.obs;
  String? blaceidex = '1';
  String? blacetype = '1';
  List blancList = [];
  Future<void> insertBlance() async {
    if (blancount.text.isEmpty) {
      Get.snackbar('تنبيه', 'يرجى إدخال مبلغ الرصيد');
      return;
    }
    statusrequst = Statusrequst.loading;
    try {
      var response = await funserver.insBlanc(
        blacetype!,
        blancdatt.text,
        blancditl.text,
        blancnoot.text,
        blancount.text,
        blaceidex!,
      );
      if (response['status'] == "success") {
        statusrequst = Statusrequst.success;
        loadBlance();
        blancdatt.clear();
        blancditl.clear();
        blancnoot.clear();
        blancount.clear();
        Get.back();
      } else {
        statusrequst = Statusrequst.failure;
      }
    } catch (e) {
      statusrequst = Statusrequst.failure;
      // print("Exception Error: $e");
    }
    update();
  }

  loadBlance() async {
    blancList.clear();
    statusrequst = Statusrequst.loading;
    update();
    try {
      var response = await funserver.blance();
      if (response['status'] == "success") {
        blancList.addAll(response['data']);
      } else {
        statusrequst = Statusrequst.failure;
      }
    } catch (e) {
      statusrequst = Statusrequst.failure;
      // print("Error in selectacoun: $e");
    }
    // await changeDigits();
    // sumformat();
    sumBlance();
    update();
  }

  sumBlance() async {
    statusrequst = Statusrequst.loading;
    blinDs.value = '0';
    blOuDs.value = '0';
    blFDs.value = '0';
    blinUss.value = '0';
    blOUss.value = '0';
    blFUs.value = '0';
    update();
    try {
      var response = await funserver.summBlance();
      if (response['status'] == "success") {
        var sums = response['data'];
        blinD = double.tryParse(sums['out_1'].toString()) ?? 0;
        blOuD = double.tryParse(sums['in_1'].toString()) ?? 0;
        blinUs = double.tryParse(sums['out_2'].toString()) ?? 0;
        blOUs = double.tryParse(sums['in_2'].toString()) ?? 0;
        blFD = blinD - blOuD;
        blFU = blinUs - blOUs;
        blinDs.value = formatAny(blinD);
        blOuDs.value = formatAny(blOuD);
        blFDs.value = formatAny(blFD);
        blinUss.value = formatAny(blinUs, type: 2);
        blOUss.value = formatAny(blOUs, type: 2);
        blFUs.value = formatAny(blFU, type: 2);
        update();
        statusrequst = Statusrequst.success;
      } else {
        // _resetToZero();
        statusrequst = Statusrequst.success;
      }
    } catch (e) {
      // print(e);
      // _resetToZero();
      statusrequst = Statusrequst.failure;
    } finally {
      update();
    }
  }

  deletBluanc(String idbi) async {
    statusrequst = Statusrequst.loading;
    update();
    try {
      var response = await funserver.deltBlance(idbi);
      if (response['status'] == "success") {
        Get.back();
        loadBlance();
      } else {
        statusrequst = Statusrequst.failure;
      }
    } catch (e) {
      statusrequst = Statusrequst.failure;
      // print("Error in selectacoun: $e");
    }
    update();
  }

  String fixArabic(String text) {
    // دالة reshape تقوم بوصل الحروف العربية بشكل صحيح
    return ArabicReshaper().reshape(text);
  }

  Future<void> reportInvoice(
    BuildContext context,
    PdfAction action,
    String a1,
    String a2,
    String a3,
    String a4,
    String a5,
    String a6,
    String a7,
    String a8,
    String a9,
    String suum,
    String nmub,
    String company,
    String subb,
    String drivname,
    String numcar,
    String typcar,
    String moveTrans,
    String aconutTrans,
    String mydate,
    String rebls,
  ) async {
    final reshaper = ArabicReshaper();
    final fontData = await rootBundle.load("assets/fonts/Cairo-Black.ttf");
    final arabicFont = pw.Font.ttf(fontData); // الآن هو معرف في هذه الدالة

    final List<List<pw.Widget>> invoiceRows = [
      [pw.Text(a1), pw.Text('مناولة السيارات الجانب السورى'), pw.Text('1')],
      [pw.Text(a2), pw.Text('رسوم جمركية والامانات الضريبية'), pw.Text('2')],
      [pw.Text(a3), pw.Text('الجباية'), pw.Text('3')],
      [pw.Text(a4), pw.Text('صحة'), pw.Text('4')],
      [pw.Text(a5), pw.Text('مصاريف معاملة'), pw.Text('5')],
      [pw.Text(a6), pw.Text('فحص'), pw.Text('6')],
      [pw.Text(a7), pw.Text('اشعاع'), pw.Text('7')],
      [pw.Text(a8), pw.Text('مصاريف اخرى'), pw.Text('8')],
      [pw.Text(a9), pw.Text('أجور شركة التخليص'), pw.Text('9')],
      [pw.Text(aconutTrans), pw.Text('أجور نقل $moveTrans'), pw.Text('10')],
      [
        pw.Text(rebls, style: pw.TextStyle(color: PdfColors.red)),
        pw.Text('مرتجع'),
        pw.Text('11'),
      ],
      [pw.Text(suum), pw.Text('المجمــوع الكلـــــي'), pw.Text('')],
    ];
    PdfService.processPdf(
      // ignore: use_build_context_synchronously
      context: context,
      title: company,
      footerText: '',
      action: action,
      titlechildren: [
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      reshaper.reshape("مكتب يوسف العنزى"), // هنا السر!
                      style: pw.TextStyle(
                        font: arabicFont, // الخط الذي قمت بتحميله
                        fontSize: 24,
                      ),
                    ),
                    pw.SizedBox(height: 4),
                    pw.Text(
                      'للإخراج والتخليص والنقل الجمركى',
                      style: pw.TextStyle(color: PdfColors.red, fontSize: 14),
                    ),
                    pw.SizedBox(height: 4),
                    pw.Text(
                      'منفذ الوليد الحدودى',
                      style: pw.TextStyle(color: PdfColors.black, fontSize: 12),
                    ),
                  ],
                ),
                // pw.Image(mypicture3, width: 150, height: 150),
              ],
            ),
            pw.Divider(thickness: 1),
            pw.Text('رقم الفاتورة: $nmub', style: pw.TextStyle(fontSize: 11)),
            pw.Center(
              child: pw.Container(
                padding: pw.EdgeInsets.all(5),
                decoration: pw.BoxDecoration(
                  borderRadius: pw.BorderRadius.circular(15),
                  color: PdfColors.blue,
                ),
                child: pw.Text(
                  'الى شركة: $company',
                  style: pw.TextStyle(
                    fontSize: 12,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColors.white,
                  ),
                ),
              ),
            ),
            pw.Text('تحية طيبة :', style: pw.TextStyle(fontSize: 11)),
            pw.Text(
              'ادناه المبالغ الخاصة بكشف الحساب.',
              style: pw.TextStyle(fontSize: 11),
            ),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text(
                  'نوع المادة : $subb',
                  style: pw.TextStyle(fontSize: 11),
                ),
                pw.Text(
                  'نوع السيارة: $typcar',
                  style: pw.TextStyle(fontSize: 11),
                ),
              ],
            ),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text(
                  'اسم السائق: $drivname',
                  style: pw.TextStyle(fontSize: 11),
                ),
                pw.Text(
                  'رقم السيارة: $numcar',
                  style: pw.TextStyle(fontSize: 11),
                ),
              ],
            ),
          ],
        ),
      ],
      tables: [
        PdfTableData(
          tableName: '',
          headers: ['المبلغ', 'الـمـــــــــــــــــــادة', 'ت'],
          rows: invoiceRows,
        ),
      ],
      children: [
        pw.SizedBox(height: 5),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            // pw.Container(
            //   width: 60,
            //   height: 60,
            //   color: PdfColors.grey300,
            //   child: pw.Center(
            //     child: pw.Center(
            //       // هنا التعديل: استخدمنا pw.Image ونطيناها الصورة
            //       child: pw.Image(pdfBarcodeImg, fit: pw.BoxFit.cover),
            //     ),
            //   ),
            // ),
            pw.Padding(
              padding: pw.EdgeInsets.only(right: 350),
              child: pw.Column(
                crossAxisAlignment:
                    pw.CrossAxisAlignment.start, // لمحاذاة النصوص لليسار
                children: [
                  pw.Padding(
                    padding: pw.EdgeInsets.only(top: 20),
                    child: pw.Text(
                      'المدير المفوض',
                      style: pw.TextStyle(
                        fontSize: 8,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                  ),
                  pw.Text('يوسف العنزى', style: pw.TextStyle(fontSize: 8)),

                  pw.Text(mydate, style: pw.TextStyle(fontSize: 8)),
                ],
              ),
            ),
          ],
        ),
        pw.Container(
          height: 20,
          width: double.infinity,
          decoration: pw.BoxDecoration(
            color: PdfColors.black,
            borderRadius: pw.BorderRadius.circular(10),
          ),
          child: pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
            children: [
              pw.Text(
                '07809616162',
                style: pw.TextStyle(color: PdfColors.white, fontSize: 10),
              ),
              pw.Text(
                '0781152226',
                style: pw.TextStyle(color: PdfColors.white, fontSize: 10),
              ),
              // pw.Text(
              //   '07800000667',
              //   style: pw.TextStyle(color: PdfColors.white, fontSize: 10),
              // ),
              // pw.Text(
              //   'omnea104-i4k@gmail.com',
              //   style: pw.TextStyle(color: PdfColors.white, fontSize: 10),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
