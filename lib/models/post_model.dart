import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class Post {
  final int id;
  final int userId;
  final String title;
  final String body;

  Post({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'title': title,
        'body': body,
      };
}

class PostsList {
  List<Post> posts;
  PostsList({required this.posts});

  factory PostsList.fromJson(List<dynamic> json) {
    List<Post> postsList =
        json.map((postJson) => Post.fromJson(postJson)).toList();
    return PostsList(posts: postsList);
  }
}

// Future<List<Post>> fetchPosts() async {
//   final response =
//       await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

//   if (response.statusCode == 200) {
//     final jsonData = json.decode(response.body) as List<dynamic>;
//     return jsonData.map((json) => Post.fromJson(json)).toList();
//   } else {
//     throw Exception('Failed to fetch posts');
//   }
// }

class DioClient {
  final Dio _dio = Dio();

  final _baseUrl = 'https://jsonplaceholder.typicode.com';
}

Future<List<Post>> getPosts() async {
  final dio = DioClient()._dio;
  final baseUrl = DioClient()._baseUrl;
  Response getList = await dio.get(baseUrl + '/posts');

  print('list: ${getList.data}');

  List<Post> list = [];
  for (var item in getList.data) {
    Post post = Post.fromJson(item);
    list.add(post);
  }
  print(list);
  return list;
}
