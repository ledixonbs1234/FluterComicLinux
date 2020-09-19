import 'package:flutter_app/model/PageModel.dart';
import 'package:http/http.dart' as http;
class ReadResposibility{
  Future<List<PageModel>> getPages(String url)async{
    var respone =  await http.get(url);
    if(respone.statusCode != 200){
      return null;
    }
    return getImages(respone.body);
  }

  List<PageModel> getImages(String content){
    String getImageReg = r"<img(\w|\W)+?src='((\w|\W)+?)'(\w|\W)+?original='((\w|\W)+?)'";
    //tach du lieu
    RegExp reg = RegExp(getImageReg);
    var getImage = reg.allMatches(content);
    List<PageModel> pages = new List<PageModel>();

    getImage.forEach((element) {
      pages.add(PageModel(element.group(2),element.group(5)));
    });
    return pages;

  }
}