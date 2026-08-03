import 'package:cloud_functions/cloud_functions.dart';

Future<String> generateLink(
  int receptionId,
  String purpose, {
  String? documentId,
}) async {
  final functions = FirebaseFunctions.instanceFor(region: 'us-central1');
  final result = await functions.httpsCallable('generateLink').call({
    'receptionId': receptionId,
    'purpose': purpose,
    if (documentId != null) 'documentId': documentId,
  });
  return result.data['url'] as String;
}
