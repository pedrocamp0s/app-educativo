class Example {
  String name;
  String imageUrl;

  Example(Map<String, dynamic> data) {
    this.name = data['name'];
    this.imageUrl = data['imageUrl'];
  }
}
