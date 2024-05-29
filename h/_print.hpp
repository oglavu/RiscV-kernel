//
// Created by os on 5/29/24.
//

#ifndef PROJEKAT__PRINT_HPP
#define PROJEKAT__PRINT_HPP

#include "../lib/console.h"

static const char _digits[] = "0123456789ABCDEF";

void printString(char const* string);

// sign = 0 means don't check sign
void printInt(int num, int base = 10, int sgn = 0);

#endif //PROJEKAT__PRINT_HPP
