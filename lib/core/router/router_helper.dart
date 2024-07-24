enum AppPages {
  home,
  postDetails,
}

extension AppPageExtension on AppPages {
  String get toName {
    switch (this) {
      case AppPages.home:
        return "home";
      case AppPages.postDetails:
        return "post details";

      default:
        return "home";
    }
  }

  String get toPath {
    switch (this) {
      case AppPages.home:
        return "/";
      case AppPages.postDetails:
        return "/postDetails";

      default:
        return "/";
    }
  }

  String get toTitle {
    switch (this) {
      case AppPages.home:
        return "Home";
      case AppPages.postDetails:
        return "Post Details";

      default:
        return "TechJarTask";
    }
  }
}
