//
// Created by os on 5/29/24.
//

#include "../h/_print.hpp"


void KprintString(char const *string) {

    while (*string != '\0') {
        __putc(*string);
        string++;
    }

}


void KprintInt(int num, int base, int sgn) {
    char buf[16];
    bool isNeg = false;
    unsigned numAbs;

    isNeg = 0;
    if (sgn && num < 0) {
        isNeg = true;
        numAbs = -num;
    } else {
        numAbs = num;
    }

    int i = 0;
    do {
        buf[i++] = _digits[numAbs % base];
    } while ((numAbs /= base) != 0);
    if (isNeg)
        buf[i++] = '-';

    while (--i >= 0)
        __putc(buf[i]);
}