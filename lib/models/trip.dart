// ignore_for_file: constant_identifier_names

enum Season{
  // ignore: duplicate_ignore
  // ignore: constant_identifier_names
  Winter,
  Spring,
  Summer,
  Autumn,

}
enum TripType{
  Exploration,
  Recovery,
  Activities,
  Therapy
}

class Trip{
  final String id;
  final List<String> categories;
  final String  title;
  final String imageUrl;
  final List<String> activities;
    final List<String> program;
    final int duration;
    final Season season;
    final TripType tripType;
    final bool isInSummer;
    final bool isForFamilies;
    final bool isInWinter;

 const Trip({required this.id, required this.categories, required this.title, required this.imageUrl, required this.activities, required this.program, required this.duration, required this.season, required this.tripType,
  required this.isInSummer , required this.isForFamilies, required this.isInWinter});





}