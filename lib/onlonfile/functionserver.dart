import 'package:taskes/onlonfile/crud.dart';
import 'package:taskes/onlonfile/linkapi.dart';

class Functionserver {
  Crud crud = Crud();
  Functionserver(this.crud);
  singin(String user, String pass) async {
    var response = await crud.postData(Linkapi.singin, {
      "username": user,
      "password": pass,
    });
    return response.fold((l) => l, (r) => r);
  }

  serchcomp(String manme) async {
    var response = await crud.postData(Linkapi.serchcomp, {"namcomp": manme});
    return response.fold((l) => l, (r) => r);
  }

  isnComp(
    String namcomp,
    String phone,
    String adress,
    String mang,
    String typ,
  ) async {
    var response = await crud.postData(Linkapi.inscomp, {
      "namcomp": namcomp,
      "phone": phone,
      "adress": adress,
      "mang": mang,
      "typ": typ,
    });
    return response.fold((l) => l, (r) => r);
  }

  isnMovacou(
    String compsent,
    String costt,
    String a1,
    String a2,
    String a3,
    String a4,
    String a5,
    String a6,
    String a7,
    String a8,
    String a9,
    String datt,
    String idcom,
    String idex,
    String iduser,
    String namdriv,
    String nott,
    String numbcar,
    String numbme,
    String subj,
    String typcar,
    String moveto,
    String acountmoveto,
    String reblec,
  ) async {
    var response = await crud.postData(Linkapi.insertmovac, {
      "compsent": compsent,
      "costt": costt,
      "a1": a1,
      "a2": a2,
      "a3": a3,
      "a4": a4,
      "a5": a5,
      "a6": a6,
      "a7": a7,
      "a8": a8,
      "a9": a9,
      "datt": datt,
      "idcom": idcom,
      "idex": idex,
      "iduser": iduser,
      "namdriv": namdriv,
      "nott": nott,
      "numbcar": numbcar,
      "numbme": numbme,
      "subj": subj,
      "typcar": typcar,
      "moveto": moveto,
      "acountmoveto": acountmoveto,
      "reblec": reblec,
    });
    return response.fold((l) => l, (r) => r);
  }

  updatComp(
    String namcomp,
    String phone,
    String adress,
    String mang,
    String idcom,
  ) async {
    var response = await crud.postData(Linkapi.compupdat, {
      "namcomp": namcomp,
      "phone": phone,
      "adress": adress,
      "mang": mang,
      "idcom": idcom,
    });
    return response.fold((l) => l, (r) => r);
  }

  lodcomp() async {
    var response = await crud.postData(Linkapi.company, {});
    return response.fold((l) => l, (r) => r);
  }

  blance() async {
    var response = await crud.postData(Linkapi.blance, {});
    return response.fold((l) => l, (r) => r);
  }

  deltcompInf(String idcom) async {
    var response = await crud.postData(Linkapi.deletcomp, {"idcom": idcom});
    return response.fold((l) => l, (r) => r);
  }

  deltAcount(String idmov) async {
    var response = await crud.postData(Linkapi.deletAcount, {"idmov": idmov});
    return response.fold((l) => l, (r) => r);
  }

  deltpaid(String idpush) async {
    var response = await crud.postData(Linkapi.deletpaid, {"idpush": idpush});
    return response.fold((l) => l, (r) => r);
  }

  lodcoacount(String idcom) async {
    var response = await crud.postData(Linkapi.lodcoacount, {"idcom": idcom});
    return response.fold((l) => l, (r) => r);
  }

  lodcoToDate(String idcom, String startDate, String endDate) async {
    var response = await crud.postData(Linkapi.lodcoTowDate, {
      "idcom": idcom,
      "startdate": startDate,
      "enddate": endDate,
    });
    return response.fold((l) => l, (r) => r);
  }

  lodcoPaid(String idcom) async {
    var response = await crud.postData(Linkapi.loadPaid, {"idcom": idcom});
    return response.fold((l) => l, (r) => r);
  }

  lodcoPaidTodate(String idcom, String startdate, String enddate) async {
    var response = await crud.postData(Linkapi.loadPaidTodae, {
      "idcom": idcom,
      "startdate": startdate,
      "enddate": enddate,
    });
    return response.fold((l) => l, (r) => r);
  }

  paidins(
    String costt,
    String datt,
    String idcom,
    String idex,
    String iduser,
    String nott,
  ) async {
    var response = await crud.postData(Linkapi.paidinsert, {
      "costt": costt,
      "datt": datt,
      "idcom": idcom,
      "idex": idex,
      "iduser": iduser,
      "nott": nott,
    });
    return response.fold((l) => l, (r) => r);
  }

  summtion(String idcom) async {
    var response = await crud.postData(Linkapi.summtion, {"idcom": idcom});
    return response.fold((l) => l, (r) => r);
  }

  summtionToldate(String idcom, String startdate, String enddate) async {
    var response = await crud.postData(Linkapi.summtionToDat, {
      "idcom": idcom,
      "startdate": startdate,
      "enddate": enddate,
    });
    return response.fold((l) => l, (r) => r);
  }

  insBlanc(
    String typ,
    String datt,
    String datile,
    String noott,
    String blanc,
    String idex,
  ) async {
    var response = await crud.postData(Linkapi.insetblanc, {
      "typ": typ,
      "datt": datt,
      "datile": datile,
      "noott": noott,
      "blanc": blanc,
      "id_ex": idex,
    });
    return response.fold((l) => l, (r) => r);
  }

  summBlance() async {
    var response = await crud.postData(Linkapi.sumblance, {});
    return response.fold((l) => l, (r) => r);
  }

  deltBlance(String idbl) async {
    var response = await crud.postData(Linkapi.deletblanc, {"idbl": idbl});
    return response.fold((l) => l, (r) => r);
  }
}
