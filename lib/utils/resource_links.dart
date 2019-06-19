// assets ===============================
class AppAssets {
  AppAssets._();
  static AppAssets _appAssets;
  static AppAssets get appAssets =>
      _appAssets ?? (_appAssets = AppAssets._());



  String get bgNavSection => "images/drawer_bg.png";
  String get watermelonAvatar => "images/watermelon.jpeg";
  String get navBg => "images/Mask_2.png";
}
