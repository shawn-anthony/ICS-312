Shawn Anthony
ICS 312
Fall 2021
Casanova
Assignment 7


Exercise 1

--------------
    z = 8
--------------
    y = 3
--------------
    x = 4
--------------
 ret @ to main
--------------
  saved EBP
--------------
    a = 7
--------------
  stuff = 13
--------------
    b = 10
--------------
    a = 7
--------------
  ret @ to f
--------------
  saved EBP
--------------
    z = -28
--------------
    y = ?
--------------



Exercise 2

--------------
  count = 8
--------------
    n = 2
--------------
 ret @ to main 
--------------
  saved EBP
--------------
    z = ? 
--------------
    y = 12
--------------
  count = 6
-------------- 
    n = 0    
--------------
  ret @ to g
--------------
  saved EBP
--------------
    z = ?
--------------
    y = 10
--------------
  count = 3  
--------------
   n = -2
--------------
  ret @ to g 
--------------
  saved EBP
--------------
    z = ?
--------------
    y = 8
--------------


Exercise 3


int a = 3;
int b = 4;
int c;

int main(void) {
    c = b + f(a, b);

    printf("%d", c);
    return 0;
}

int f(int a, int b) {
    if (b % 3 == 0) {
        return 1;
    }
    return a - f(b, a - 1);
}


   