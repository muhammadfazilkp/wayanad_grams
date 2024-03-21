import 'package:hive/hive.dart';
part 'note.g.dart';

@HiveType(typeId: 0)
class Note {
  @HiveField(0)
  final String heading;

  @HiveField(1)
  final String content;

  @HiveField(3)
  final int? key;

  Note(this.heading, this.content, this.key);
}
