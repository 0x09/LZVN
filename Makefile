##
#
# LZVN encode/decode routines
#
# Intel 64-bit (x86_64) version
#
##

PREFIX=/usr/local

RANLIB=ranlib
INSTALL=install
ARFLAGS=cru
CFLAGS=-g0 -arch arm64 -arch x86_64 -Ofast

all: lzvn

.c.o:
	$(CC) $(CFLAGS) -c $< -o $@

libFastCompression.a: lzvn_encode.o lzvn_decode.o
	$(AR) $(ARFLAGS) $@ lzvn_encode.o lzvn_decode.o
	$(RANLIB) libFastCompression.a

lzvn: lzvn.o libFastCompression.a
	$(CC) $(CFLAGS) -o $@ lzvn.o -L. -lFastCompression

clean:
	rm -f *.o *.a lzvn

install: lzvn
	$(INSTALL) lzvn $(PREFIX)/bin
