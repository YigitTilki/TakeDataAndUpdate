abstract class BaseValidators {
  String? firstName({required String? value});
  String? lastName({required String? value});
  String? password({required String? value});
  String? rePassword({
    required String? value,
    required String passwordController,
  });
  String? eMail({required String? value, required String emailController});
  String? loginEMail({required String? value, required String emailController});
  String? loginPassword({required String? value});
}
