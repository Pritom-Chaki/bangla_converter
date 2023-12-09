///[BanglaConverter]main converter class where all code
class BanglaConverter {
  ///english to bangla [engToBan] converter method
  static String engToBan(inputValue) {
    //convert to string and make a list
    var strList = inputValue.toString().split('');
    //declare a list variable
    List<String> returnList = [];
    //loop on the list
    for (var str in strList) {
      //switch case to convert number and add to the list
      switch (str) {
        case "0":
          returnList.add("০");
          break;
        case "1":
          returnList.add("১");
          break;
        case "2":
          returnList.add("২");
          break;
        case "3":
          returnList.add("৩");
          break;
        case "4":
          returnList.add("৪");
          break;
        case "5":
          returnList.add("৫");
          break;
        case "6":
          returnList.add("৬");
          break;

        case "7":
          returnList.add("৭");
          break;
        case "8":
          returnList.add("৮");
          break;
        case "9":
          returnList.add("৯");
          break;
        default:
          returnList.add(str);
          break;
      }
    }
    //return all join list
    return returnList.join("");
  }

  ///bangla to english [banToEng] converter method
  static String banToEng(inputValue) {
    //convert to string and make a list
    var strList = inputValue.toString().split('');
    //declare a list variable
    List<String> returnList = [];
    //loop on the list
    for (var str in strList) {
      //switch case to convert number and add to the list
      switch (str) {
        case "০":
          returnList.add("0");
          break;
        case "১":
          returnList.add("1");
          break;
        case "২":
          returnList.add("2");
          break;
        case "৩":
          returnList.add("3");
          break;
        case "৪":
          returnList.add("4");
          break;
        case "৫":
          returnList.add("5");
          break;
        case "৬":
          returnList.add("6");
          break;

        case "৭":
          returnList.add("7");
          break;
        case "৮":
          returnList.add("8");
          break;
        case "৯":
          returnList.add("9");
          break;
        default:
          returnList.add(str);
          break;
      }
    }
    //return all join list
    return returnList.join("");
  }
}
