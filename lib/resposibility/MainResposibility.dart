import 'package:flutter_app/model/Comic.dart';
import 'package:http/http.dart' as http;

class MainResosibility {

  Future<Comic> getInfoComicFromUrl(String url) async{
    var res =await http.get(url);
    if(res.statusCode == 200){
      String content = res.body.toString();
      ExcuteContentAndGet(content);
    }
  }

  Comic ExcuteContentAndGet(String content){
    String cumNhoReg = r'item-detail(\W|\w)+?article';
    String cumNhoContent = RegExp(cumNhoReg).stringMatch(content);

  }

  Comic GetPhanInfo(String content){
    String childReg =r'title(\w|\W)+?>((\w|\W)+?)<(\w|\W)+?src="((\w|\W)+?)"(\w|\W)+?Tình trạng(\w|\W)+?">((\w|\W)+?)<(\W|\w)+?Lượt xem(\W|\w)+?">((\W|\w)+?)<(\W|\w)+?href="((\W|\w)+?)"(\W|\w)+?Nội dung(\W|\w)+?<p>((\W|\w)+?)<\/p>';
    final regex = RegExp(childReg).firstMatch(content);
    //ten
    regex.group(2);
    //img
    regex.group(5);
    //tinh trang
    regex.group(9);
    //luot xem
    regex.group(13);
    //url
    regex.group(16);
    //noi dung
    regex.group(20);
  }


}