import 'package:get/get.dart';
import 'package:vehicle_campro/pages/camera_page.dart';
import 'package:vehicle_campro/pages/landing_page.dart';
import 'package:vehicle_campro/pages/language_page.dart';
import 'package:vehicle_campro/pages/login_page.dart';

class Routes{

static const String initial = '/';
static const String languagePage = '/languagePage';
static const String loginPage = '/loginPage';
static const String cameraPage = '/cameraPage';

static String getInitial()=>'$initial';
static String getLanguagePage()=>'$languagePage';
static String getLoginPage()=>'$loginPage';
static String getCameraPage()=>'$cameraPage';


static List<GetPage> routes = [
 GetPage(name: initial, page:(){
  return LandingPage();
 },
 transition: Transition.fadeIn
 ),

  GetPage(name: languagePage, page:(){
  return LanguagePage();
 },
 transition: Transition.fadeIn
 ),

  GetPage(name: loginPage, page:(){
  return LoginPage();
 },
 transition: Transition.fadeIn
 ),

   GetPage(name: cameraPage, page:(){
  return CameraPage(cameras: [],);
 },
 transition: Transition.fadeIn
 ),
 
];

}