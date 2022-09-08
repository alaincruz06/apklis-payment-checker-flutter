import 'package:apklis_payment_checker/apklis_payment_checker.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const MethodChannel channel = MethodChannel('apklis_payment_checker');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return {
        "paid": false,
        "username": "example",
      };
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('should parse string to OperationModel `', () {
    expect(channel, equals(const MethodChannel('apklis_payment_checker')));
  });

  test('isPurchased', () async {
    const packageId = 'com.example.nova.prosalud';
    final status = await ApklisPaymentChecker.isPurchased(packageId);

    expect(status.paid, false);
    expect(status.username, "example");
  });
}
