##
#
# LZVN encode/decode routines
#
##

PREFIX ?= /usr/local

RANLIB ?= ranlib
INSTALL ?= install
ARFLAGS ?= cru
CFLAGS := -g0 -O3 -ffast-math $(CFLAGS)

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
