## Die Header des Betriebsystems
Wenn eine Header mit #include <header> eingebunden wird, dann schaut der Compiler automatisch in ein paar vordefinierte Pfade nach z.B.
 * /usr/local/include
 * /usr/include
Diese können mit -Ipfad erweitert werden. Sie müssen also nicht extra berücksichtigt werden. Man muss nur die Shared Library dem Compiler mitgeben (e.g. -l)

## Abhängigkeit input.c zu main.c
Es muss beachtet werden, dass in main.c die header von input eingebunden wird und main.o und input.o zusammen gelinkt werden.

## Komplikationen wegen install, clean im Verzeichnis
Wenn ein Befehl in .PHONY definiert ist, dann schaut die makefile nicht mehr im lokalen Verzeichnis nach, sondern führt die Regel mit diesem Namen aus. Somit kann es kein Konflikt zwischen lokalen Dateien und definierten Regeln geben.

## Speicherdarstellung des Strings "Hello World!"
Zeichen H: 0x48
Zeichen e: 0x65
Zeichen l: 0x6C
Zeichen l: 0x6C
Zeichen o: 0x6F
Zeichen  : 0x20
Zeichen W: 0x57
Zeichen o: 0x6F
Zeichen r: 0x72
Zeichen l: 0x6C
Zeichen d: 0x64
Zeichen !: 0x21
Zeichen \0: 0x00 <-- hohe Speicheradresse

## Speicherdarstellung von Ganzzahlen

Name  |  big endian  |  little endian |
------|--------------|----------------|
 i    | DE AD BE EF  | EF BE AD DE    |
 s    | 04 01        | 01 04          |
 c    | 07           | 07             |

Die höchste Speicheradresse ist jeweils rechts.

## Speicherdarstellung eines structs ohne Alignment
Mit -O0:

(gdb) x /20bx &test
0x7fffffffe830:	0x07	0x05	0x40	0x00	0x00	0xfe	0xff	0xff
0x7fffffffe838:	0x7f	0x00	0x20	0x00	0x23	0x01	0x56	0x04
0x7fffffffe840:	0x00	0x10	0x00	0x00
 
Mit -O0 -fpack-struct

(gdb) x /14bx &test
0x7fffffffe840:	0x07	0x00	0xfe	0xff	0xff	0x7f	0x00	0x20
0x7fffffffe848:	0x23	0x01	0x56	0x04	0x00	0x10
