class Endpoints {
  static const String APP_NAME = "COZA App";
  static const int APP_VERSION = 1;

  static const String BASE_URL = "https://coza-api.herokuapp.com/api/v1/";


  static const String REGISTER = "auth/register";
  static const String LOGIN = "auth/login";
  static const String UPLOAD_IMAGE = "services/file/presign-url";
  static const String UPDATE_PROFILE = "user/profile/update";
  static const String VERIFY_OTP = "auth/verify/";
  static const String PASSWORD_REQUEST = "auth/password-request";
  static const String RESET_PASSWORD = "auth/password-reset";
}
