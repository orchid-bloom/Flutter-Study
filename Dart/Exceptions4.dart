main(List<String> args) {
  _exceptions();
}

_exceptions(){
   
  //抛出或者 扔出一个异常的示例：
  //  throw new FormatException('Expected at least 1 section');

   //抛出任意的对象：
  //  throw 'Out of llamas!';

  try {
  breedMoreLlamas();
} catch(e) {
  print('Error: $e');  // Handle the exception first.
} finally {
  cleanLlamaStalls();  // Then clean up.
}
}

breedMoreLlamas() {

}

cleanLlamaStalls() {
  
}