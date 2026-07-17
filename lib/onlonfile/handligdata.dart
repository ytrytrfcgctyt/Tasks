import 'package:taskes/onlonfile/statusRequst.dart';

handlingdata(response) {
  if (response is Statusrequst) {
    return response;
  } else {
    return Statusrequst.success;
  }
}
