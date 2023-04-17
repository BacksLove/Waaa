List<T> getListFromIndices<T>(List<int> indices, List<T> elements) {
  List<T> result = [];
  for (int index in indices) {
    if (index >= 0 && index < elements.length) {
      result.add(elements[index]);
    }
  }
  return result;
}
