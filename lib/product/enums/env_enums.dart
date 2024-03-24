import 'package:flutter_dotenv/flutter_dotenv.dart';

enum EnvEnums {
  baseUrl,
  serviceId,
  templateId,
  userId,
  replyMail;

  String get dotEnv => dotenv.get(name);
}
