
import 'package:dio/dio.dart';

class Global {


  static var flavor = 'boss';

  static const String url = "https://api.info.gtwins.co.kr";

  static Dio dio = Dio(BaseOptions(baseUrl: url, headers: {
    "Access-Control-Allow-Origin": "*",
    "REST_KEY": "LsPhPRP03El7enX4JX15G0y"
  }));




  static String userInfo =
      "https://docs.google.com/document/d/1w4Zpe5t8WEj2b4LLVZFnRPY72qrHY7f2/edit?usp=share_link&ouid=101790036749393857821&rtpof=true&sd=true";
  
  static String checkPersonal =
      "https://docs.google.com/document/d/1KuMOZ9jMFdGMHUE31KonPFQjrqDMN3df/edit?usp=share_link&ouid=101790036749393857821&rtpof=true&sd=true";
  static String checkService =
      "https://docs.google.com/document/d/1csBDYEa6t0fktCiGVEMKGLDO8KyJLsu6/edit";

  static String eventUrl = 'https://www.eugenefn.com/af680.do';


  static bool isEugene = false;

  static String bossUrl = 'https://stock.gtwins.co.kr';
  // static const Color Angle1Color = Colors.red;
  // static const Color Angle2Color = Colors.purple;
  // static const Color Angle3Color = Colors.blue;

  // static Color BigTopColor = Colors.red.withOpacity(0.6);
  // static Color BigLowColor = Colors.blue.withOpacity(0.6);
  // static Color MiddleTopColor = Colors.red.withOpacity(0.8);
  // static Color MiddleLowColor = Colors.blue.withOpacity(0.8);
  // static Color SmallTopColor = Colors.red.withOpacity(1.0);
  // static Color SmallLowColor = Colors.blue.withOpacity(1.0);

  // static const Color AngleTextColor = Colors.pink;
}
