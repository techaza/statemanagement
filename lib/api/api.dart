import 'dart:async';

Future<String> getProfileUserName() async {
  await Future.delayed(const Duration(seconds: 5));

  return "Spider Man";
}

Stream<int> getSessionTime() {
  return Stream.periodic(
      const Duration(seconds: 1), (sessionTime) => sessionTime++);
}
