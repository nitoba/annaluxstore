import 'package:annaluxstore/app/modules/home/repositories/interfaces/home_repository_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  IHomeRepository repository;
  // MockClient client;

  setUp(() {
    // client = MockClient();
    //repository = CategorieRepository();
  });

  group('CategorieRepository Test', () {
    //  test("First Test", () {
    //    expect(repository, isInstanceOf<CategorieRepository>());
    //  });

    test('returns a Post if the http call completes successfully', () async {
      //    when(client.get('https://jsonplaceholder.typicode.com/posts/1'))
      //        .thenAnswer((_) async =>
      //            Response(data: {'title': 'Test'}, statusCode: 200));
      //    Map<String, dynamic> data = await repository.fetchPost(client);
      //    expect(data['title'], 'Test');
    });
  });
}
