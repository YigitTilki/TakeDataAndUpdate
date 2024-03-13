import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;

class EmailService {
  Future<void> sendEmail({
    required String name,
    required String replyMail,
    required String subject,
    required String message,
    required String toEmail,
  }) async {
    const serviceId = 'service_l7yp5c8';
    const templateId = 'template_obeszmf'; //TODO: add env
    const userId = 'qFcBLaFNEIJWBBJU1';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    await http.post(
      url,
      headers: {
        'origin': 'http://localhost', // TODO: Change to your domain
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'user_name': name,
          'user_email': replyMail,
          'to_email': toEmail,
          'user_subject': subject,
          'user_message': message,
        },
      }),
    );
  }

  int generateCode() {
    final random = Random();
    final randomNumber = random.nextInt(90000) + 10000;
    return randomNumber;
  }
}
