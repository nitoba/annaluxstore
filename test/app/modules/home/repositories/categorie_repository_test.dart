import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:annaluxstore/app/modules/home/repositories/interfaces/categorie_repository_interface.dart';

void main() {
  ICategorieRepository repository;
  // MockClient client;

  setUp(() {
    // client = MockClient();
    // repository = CategorieRepository(client);
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
