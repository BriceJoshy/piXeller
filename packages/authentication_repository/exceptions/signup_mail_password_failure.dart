class SignUpWithEmailAndPasswordFailure {
  final String message;
  const SignUpWithEmailAndPasswordFailure(
      [this.message = "An Unknown error occured"]);

  factory SignUpWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case '':
        return const SignUpWithEmailAndPasswordFailure(
            "Please Enter a Stronger password.");
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure(
            "Please Enter a Stronger password.");
      case 'operation-not-allowed':
        return const SignUpWithEmailAndPasswordFailure(
            "Please Enter a Stronger password.");
      case 'user-disalbled':
        return const SignUpWithEmailAndPasswordFailure(
            "Please Enter a Stronger password.");
      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }
}
