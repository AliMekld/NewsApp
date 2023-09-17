import 'package:dio/dio.dart';
import 'package:newsapp/Models/newsModel.dart';

class NewsApi {
//steps of getting data from Api's
// 1- creating final instance from Dio package and pass it to the constructor
  final Dio dio;
  NewsApi(this.dio);
// 2-create an async method to get the data from api
  Future<List<NewsModel>> getArticals(String requestName) async {
    //creating instance from response to store the get method inside it
    //access the get method by dio object
    try {
      Response response = await dio.get(
          //api consist of :
          // - domain name: (https://newsapi.org/)
          // - path  : (/everything?)
          // - query or parameters  : (1- q=sport ) seperated with & (2-..... )
          //& required parametere apiKey (3- &apiKey=719f95059abe44d7b96040c83e6b3bec# )
          'https://newsapi.org/v2/everything?q=$requestName&apiKey=719f95059abe44d7b96040c83e6b3bec#');
      // the data of the api stored in two forms ( List or map)
      // the api gererate a  map<String(key),dynamic(value)>
      Map<String, dynamic> jsonData = response.data;
      //getting custom data (articals) from api return type always  (List<dynamic>)
      List<dynamic> articals = jsonData['articles'];
      //Creating an empty list of NewsModel to store converted list<dynamic> in object of type newsModel
      List<NewsModel> newsList = [];
      //loopin on articals (List<dynamic>)
      for (var artical in articals) {
        //get instance from NewsModel which will store in newsList (list of NewsModel)
        NewsModel newsModel = NewsModel(
            //store data inside the object

            imgUrl: artical['urlToImage'],
            newsHeader: artical['title'],
            newsSecondHeader: artical['description'],
            newsLink: artical['url']);

        //adding object of type (newsModel) after storing data inside it inside the newsList

        newsList.add(newsModel);
        RemoveEmptyObjectFromList(newsList);
      }
      return newsList;
    } catch (e) {
      print(e.toString());
    }
    //return the list of <newsModel> to be presented inside UI
    return [];
  }

  // ignore: non_constant_identifier_names
  void RemoveEmptyObjectFromList(List<NewsModel> newsList) {
    newsList.removeWhere((element) =>
        element.imgUrl == null || element.newsSecondHeader == null);
  }

  Future<List<NewsModel>> getCustomRequest(String requestName, Dio dio) async {
    Response response = await dio.get(
        'https://newsapi.org/v2/everything?q=$requestName&apiKey=719f95059abe44d7b96040c83e6b3bec#');

    List<dynamic> jsonData = response.data;
    List<NewsModel> newsList = [];
    var convertedList =
        await convertJsonDataIntoListOfNewsModel(newsList, jsonData);
    return convertedList;
  }

  List<NewsModel> convertJsonDataIntoListOfNewsModel(
      List<NewsModel> listOfObjects, List<dynamic> articals) {
    for (var artical in articals) {
      NewsModel newsModel = NewsModel(
          //store data inside the object
          imgUrl: artical['urlToImage'],
          newsHeader: artical['title'],
          newsSecondHeader: artical['description'],
          newsLink: artical['url']);
      listOfObjects.add(newsModel);
    }
    return listOfObjects;
  }
}
