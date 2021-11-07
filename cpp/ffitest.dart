import 'dart:ffi';

void main(List<String> arguments) {
  final lib = DynamicLibrary.open("/home/azkadev/Desktop/localdb/cpp/lib.so");
  final add =
      lib.lookupFunction<Int32 Function(Int32, Int32), int Function(int, int)>(
          "add");
  final result = add(10, 15);
  print(result);
}
