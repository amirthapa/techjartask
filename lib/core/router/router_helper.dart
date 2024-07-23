enum AppPages {
  home,
  listDetails,
}

extension AppPageExtension on AppPages {
  String get toName {
    switch (this) {
      case AppPages.home:
        return "HOME";
      case AppPages.listDetails:
        return "DETAILS";

      default:
        return "HOME";
    }
  }

  String get toPath {
    switch (this) {
      case AppPages.home:
        return "/";
      case AppPages.listDetails:
        return "/details";

      default:
        return "/";
    }
  }

  String get toTitle {
    switch (this) {
      case AppPages.home:
        return "Home";
      case AppPages.listDetails:
        return "Details";

      default:
        return "TechJarTask";
    }
  }
}
