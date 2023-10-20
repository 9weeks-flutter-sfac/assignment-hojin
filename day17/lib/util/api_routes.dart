class ApiRoutes {
  static String login =
      'http://52.79.115.43:8090/api/collections/users/auth-with-password';
  static String signup =
      'http://52.79.115.43:8090/api/collections/users/records';
  static String secrets =
      'http://52.79.115.43:8090/api/collections/secrets/records?sort=-created';
  static String users =
      'http://52.79.115.43:8090/api/collections/users/records?sort=-created';
  static String upload =
      'http://52.79.115.43:8090/api/collections/secrets/records';
}
