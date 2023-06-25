class SignUpWithEmailAndPasswordFailure {
  final String message;
  const SignUpWithEmailAndPasswordFailure(
      [this.message = "An Unknown error occured"]);

  factory SignUpWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case '':
        return const SignUpWithEmailAndPasswordFailure(
            "Please Enter a Stronger password.");
      case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailure(
            "Email is not valid or badly formatted.");
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure(
            "An account already exit for that email.");
      case 'operation-not-allowed':
        return const SignUpWithEmailAndPasswordFailure(
            "Operation is not allowed. Please contact support.");
      case 'user-disalbled':
        return const SignUpWithEmailAndPasswordFailure(
            "This user has been disabled.");
      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }
}
