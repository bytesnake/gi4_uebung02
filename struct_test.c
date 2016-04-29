#include <stdlib.h>
#include <stdio.h>
#include <signal.h>

struct bigone {
    char index;         /* =7 */
    int avalue;         /* = -512 */
    short shortvalue;   /* =127 */
    char space;         /* =32 */
    short sarray [2];   /* = {0x123, 0x456} */
    int anothervalue;   /* = 4096 */
};

int main(int argc, const char *argv[])
{
    struct bigone test;
    test.index = 7;
    test.avalue = -512;
    test.shortvalue = 127;
    test.space = 32;
    test.sarray[0] = 0x123;
    test.sarray[1] = 0x456;
    test.anothervalue = 4096;

    __asm__ ("" : : "" (test));
    raise(SIGINT);

    return 0;
}
