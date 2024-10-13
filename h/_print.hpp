//
// Created by os on 5/29/24.
//

#ifndef PROJEKAT__PRINT_HPP
#define PROJEKAT__PRINT_HPP

#include "../h/_buffer.hpp"

static const char _digits[] = "0123456789ABCDEF";

void KprintString(char const* string);

// sign = 0 means don't check sign
void KprintInt(int num, int base = 10, int sgn = 0);

#endif //PROJEKAT__PRINT_HPP
