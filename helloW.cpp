#include <iostream>

int main()
{
 std::cout << "Hello world!"<< std::endl;
 char a = 0;
 std::cout << "Enter a number"<<std::endl;
 std::cin >> a;

 if (a == '0')
  {
   std::cerr << "Variable a can't be a 0"<< std::endl;
  }
 else
  {
   std::cout << "OK!" << std::endl;
  }

 return 0;
}
//Output: hello
