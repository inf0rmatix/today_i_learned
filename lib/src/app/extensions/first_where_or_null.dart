extension FirstWhereOrNull<T> on Iterable<T> {
  T? firstWhereOrNull(bool Function(T element) condition) {
    for (final T element in this) {
      if (condition(element)) {
        return element;
      }
    }

    return null;
  }
}
