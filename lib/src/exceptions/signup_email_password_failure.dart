class SignUpWithEmailAndPasswordFailure {
  static String getMessageFromErrorCode({String errorCode=""}) {
    switch (errorCode) {
      case 'weak-password':
        return  'Please enter stronger password.';
      case 'invalid-email':
        return  
            'Email is not valid or badly formatted';
      case 'email-already-in-use':
        return  
            'An account already exist for that email';
      case 'operation-not-allowed':
        return  
            'Operations is not allowed. Please contact support';
      case 'user-disabled':
        return  
            'This user has been disabled. Please contact support for help.';
      default:
        return "Sign up failed. Please try again.";
    }
  }
}
