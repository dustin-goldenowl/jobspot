abstract class StreamUseCase<T, P> {
  Stream<T> call({required P params});
}
