import 'dart:async';
import 'dart:io';

Future<bool> checkInternet() async {
  try {
    final socket = await Socket.connect(
      'google.com',
      80,
      timeout: const Duration(seconds: 3),
    );
    await socket.close();
    return true;
  } on SocketException {
    return false;
  } on TimeoutException catch (_) {
    return false;
  } catch (_) {
    return false;
  }
}
