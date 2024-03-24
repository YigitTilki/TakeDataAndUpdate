import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:take_data_and_update_project/product/enums/env_enums.dart';

class EmailService {
  Future<void> sendEmail({
    required String name,
    required String replyMail,
    required String subject,
    required String message,
    required String toEmail,
  }) async {
    final serviceId = EnvEnums.serviceId.dotEnv;
    final templateId = EnvEnums.templateId.dotEnv;
    final userId = EnvEnums.userId.dotEnv;

    final url = Uri.parse(EnvEnums.baseUrl.dotEnv);
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
