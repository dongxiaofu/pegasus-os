void _displayStr(char *str, int len);

void choose(int a, int b)
{
  if(a > b){
    // 哪些函数能用，哪些函数不能用，不清楚。用C语言写代码，仍受束缚啊。
    // 比如，我想把a和字符串混合起来。在PHP中直接用点号就能连接起来。
    _displayStr("first", 5);
  }else{
    _displayStr("second", 6);
  }
  
  return;
}
