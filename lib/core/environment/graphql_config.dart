import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:waaa/core/environment/environment.dart';

class GraphQLConfig {
  static HttpLink httpLink = HttpLink(Environment().config.apiEndpoint);

  GraphQLClient clientToQuery() =>
      GraphQLClient(link: httpLink, cache: GraphQLCache());
}
