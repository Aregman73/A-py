#include <iostream>

int gcd_operation(int a, int b) {
    while (b != 0) {
        int l = b;
        b = a % b;
        a = l;
    }
    return a;
}

void testing_gcd(int a, int b, int f) {
   std::cout << "Թիւը կազմուում է " << a << " եւ " << b << " համար, ակնկալուող արդիւնքն է " << f << ": ";
    
   int r = gcd_operation(a, b);
     if (r == f) {
  std::cout << "Ճիշտ է" << std::endl;
     } else {
  std::cout << "Սխալ" << std::endl;
       }
}

int main() {
    testing_gcd(9, 6, 3);
    testing_gcd(8, 4, 4);
    testing_gcd(4, 12233451, 1);
    testing_gcd(545656789, 10215421, 1);
    return 0;
}
