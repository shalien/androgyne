import 'package:bel_adn/bel_adn.dart';

final MagnifiqueCoupleClient _client = MagnifiqueCoupleClient(
    accessToken: '2|3USoGRKoRNqNxV0tYdmxKSoOg2D1VAzeLx4D53vp42c2add6');

Future<List<Topic>> fetchTopics() async {
  final List<Topic> topics = await _client.topics.index();

  topics.sort((Topic a, Topic b) => a.order.compareTo(b.order));

  return topics;
}
