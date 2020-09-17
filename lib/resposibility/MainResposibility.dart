import 'package:flutter_app/model/Chapter.dart';
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
    Comic comic = GetPhanInfo(cumNhoContent);
    comic.chapters = GetChapter(cumNhoContent);
    return comic;
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
    return Comic(ten: regex.group(2),imagePath: regex.group(5),
        tinhTrang: regex.group(9),luotXem: regex.group(13),url: regex.group(16),noiDung: regex.group(20));
  }

  List<Chapter> GetChapter(String content){
    var regex = RegExp(r' chapter">(\W|\w)+?href="((\W|\w)+?)"(\W|\w)+?(\W|\w)+?">((\W|\w)+?)<(\W|\w)+?small">((\W|\w)+?)<(\W|\w)+?small">((\W|\w)+?)<').allMatches(content);
    List<Chapter> chapters = new List<Chapter>();
    regex.forEach((element) {
      chapters.add(Chapter(url: element.group(2),name:element.group(6),date: element.group(9),luotXem: element.group(12)));
    });
    return chapters;
  }


}