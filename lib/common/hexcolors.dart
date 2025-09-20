import 'dart:ui';

class HexColor extends Color {
  HexColor(String hexColor) : super(_getColorFromHex(hexColor));
  static int _getColorFromHex(String hexColor) {
    var color = hexColor;
    color = color.toUpperCase().replaceAll('#', '');
    if (color.length == 6) {
      color = 'FF$color';
    }
    return int.parse(color, radix: 16);
  }
}

class HexColors {
  static String stackWidgetBorder = '#1F1940';

  //primary color

  static String primary10 = '#0C0A15';
  static String primary20 = '#110D1F';
  static String primary30 = '#1B142F';
  static String primary40 = '#231A3D';
  static String primary50 = '#302849';
  static String primary60 = '#827D91';
  static String primary70 = '#9D99A8';
  static String primary80 = '#C8C6CF';
  static String primary90 = '#E0DEE3';
  static String primary100 = '#EBEAED';

  //Accents

  static String accents10 = '#0F0017';
  static String accents20 = '#20022E';
  static String accents30 = '#350451';
  static String accents40 = '#4B006D';
  static String accents50 = '#6B2E87';
  static String accents60 = '#8D5EA3';
  static String accents70 = '#A781B8';
  static String accents80 = '#D0BADA';
  static String accents90 = '#F0E6F5';
  static String accents100 = '#FBF6FE';

  // Neutrals

  static String neutralsBlack = '#1C1C1C';
  static String neutrals10 = '#242424';
  static String neutrals20 = '#4C4C4C';
  static String neutrals30 = '#5B5B5B';
  static String neutrals40 = '#737373';
  static String neutrals50 = '#919191';
  static String neutrals60 = '#B1B1B1';
  static String neutrals70 = '#CDCDCD';
  static String neutrals80 = '#E7E7E7';
  static String neutrals90 = '#F2F2F2';
  //static String  neutrals90 ='#E6E6E6';
  static String neutrals100 = '#FAFAFA';
  static String neutralsWhite = '#FFFFFF';
  static String semiTransparentGrey = '#88888888';

  //System-Dip
  static String successGreen = '#08A045';
  static String errorRed = '#EE1010';
  static String linkBlue = '#0B4DCE';
  static String alertYellow = '#E4A000';
  static String alertOrange = '#FF4D00';
  static String aPink = '#EE1155';
  static String aTurqs = '#019C94';

  //System-light
  static String greenLight = '#E3F9EC';
  static String redLight = '#FEEAEA';
  static String lBlueLight = '#EBF0FB';
  static String lbluelight = '#FEF55E0';
  static String orangeLight = '#FFF2E5';
  static String aPinkLight = '#FFE5ED';
  static String aTurqsLight = '#E9F9F8';
  static String yellowLight = '#F6FADE';

  // Random Pallete Light

  static String r1LBg = '#FFF2E5';
  static String r2LBg = '#FEF5E0';
  static String r3LBg = '#F6F3ED';
  static String r4LBg = '#EBECEE';

  static String r5LBg = '#FAEBEB';
  static String r6LBg = '#F6FADE';
  static String r8LBg = '#EBFOFB';
  static String r9LBg = '#E9F9F8';
  static String r10LBg = '#EAFFFD';
  static String r11LBg = '#F6F3ED';

  static String r1LText = '#ED7926';
  static String r2LText = '#F7A900';
  static String r3LText = '#D4A209';
  static String r4LText = '#3C4155';
  static String r5LText = '#CB3C34';
  static String r6LText = '#A6BC1B';
  static String r7LText = '#954BEE';
  static String r8LText = '#2738A3';
  static String r9LText = '#27A38E';
  static String r10LText = '#350451';
  static String r11Text = '#A78B48';

  //Random-Palette

  static String r1 = '#ED7926';
  static String r2 = '#FFC309';
  static String r3 = '#D4A209';
  static String r4 = '#3C4155';
  static String r5 = '#CB3C34';
  static String r6 = '#AEC233';
  static String r7 = '#954BEE';
  static String r8 = '#2738A3';
  static String r9 = '#27A38E';
  static String r10 = '#2CFFED';
  static String r11 = '#A6BC1B';
  static String r12 = '#F7A900';
  static String r13 = '#8338EC';

  //Gradient

  static String grdnt00 = '#350451';
  static String grdnt01 = '#0F0017';
  static String grdnt10 = '#350451';
  static String grdnt11 = '#20022E';
  static String grdnt20 = '#954BEE';
  static String grdnt21 = '#0B4DCE';
  static String grdnt22 = '#2CFFED';

  static String transparent = '#000000B2';
  static String darkBlack = '#000000';
  static String darkBlue = '#007AFF';

  static String lightRed = '#FAEBEB';
  static String lightYellow = '#FEF5E0';
  static String lightBlack = '#EBECEE';
  static String lightOrange = '#FFF2E5';
  static String lightBlue = '#EBF0FB';
  static String lightPastelYellow = '#F6FADE';
  static String lightLemon = '#F6FADE';
  static String black_50 = '#00000080';

  // Color definitions
  static const Color white5 = Color.fromRGBO(255, 255, 255, 0.05);
  static const Color white10 = Color.fromRGBO(255, 255, 255, 0.1);
  static const Color white40 = Color.fromRGBO(255, 255, 255, 0.4);
  static const Color white70 = Color.fromRGBO(255, 255, 255, 0.7);
  static const Color white80 = Color.fromRGBO(255, 255, 255, 0.8);
  static const Color white90 = Color.fromRGBO(255, 255, 255, 0.9);
  static const Color purple = Color.fromRGBO(75, 0, 109, 1);
  static const Color purpleLight = Color.fromRGBO(251, 246, 254, 1);
  static const Color greyNeutrals60 = Color.fromRGBO(177, 177, 177, 1);
  static const Color blackNeutrals = Color.fromRGBO(28, 28, 28, 1);

  // Skinner
  static const String lightLavender = '#F8F2FF';
  static const String offWhite = '#F9F8F8';
  static const String softLilac = '#EDE7F4';

  // Pie Chart Colors List
  // Pie Chart Colors List
  static List<Color> pieChartColorsList = [
    HexColor(HexColors.accents40),
    HexColor(HexColors.accents50),
    HexColor(HexColors.accents60),
    HexColor(HexColors.accents70),
    HexColor(HexColors.accents80),
    HexColor(HexColors.accents90),
    HexColor(HexColors.accents100),
    HexColor(HexColors.accents30), // Removed semicolon
  ];
}
