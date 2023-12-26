import 'package:androgyne/src/magnifique_layer.dart';
import 'package:bel_adn/bel_adn.dart';
import 'package:flutter/material.dart';

final class BeauGosseTopicList extends StatefulWidget {
  const BeauGosseTopicList({super.key});

  @override
  State<BeauGosseTopicList> createState() => _BeauGosseTopicListState();
}

class _BeauGosseTopicListState extends State<BeauGosseTopicList> {
  late Future<List<Topic>> topics;

  Map<int, bool> _selected = {};

  int get selectedCount =>
      _selected.values.where((bool? value) => value!).length;

  @override
  void initState() {
    super.initState();
    topics = fetchTopics();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('Selected: $selectedCount'),
            const Flex(direction: Axis.horizontal),
            ElevatedButton(
              onPressed: () {
                setState(() {
                });
              },
              child: const Text('Select All'),
            ),
            const Flex(direction: Axis.horizontal),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _selected = {};
                });
              },
              child: const Text('Clear'),
            ),
          ],
        ),
        Expanded(child:
        FutureBuilder<List<Topic>>(
          future: topics,
          builder: (BuildContext context, AsyncSnapshot<List<Topic>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  final Topic topic = snapshot.data![index];
                  return ListTile(
                    leading: Checkbox(
                      value: _selected[index] ?? true,
                      onChanged: (bool? value) {
                        setState(() {
                          _selected[index] = value!;
                        });
                      },
                    ),
                    title: Text('${topic.order} ${topic.name}'),
                    selected: _selected[index] ?? true,
                    onTap: () {
                      setState(() {
                        _selected[index] == null
                            ? _selected[index] = true
                            : _selected[index] = !_selected[index]!;
                      });
                    },
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
        ),
      ],
    );
  }
}
