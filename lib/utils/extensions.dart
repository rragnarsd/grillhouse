extension ListChunkExtension<T> on List<T> {
  List<List<T>> chunked(int size) {
    if (size <= 0) throw ArgumentError('Chunk size must be greater than 0');

    final List<List<T>> chunks = <List<T>>[];
    for (int i = 0; i < length; i += size) {
      final int end = (i + size < length) ? i + size : length;
      chunks.add(sublist(i, end));
    }
    return chunks;
  }
}
