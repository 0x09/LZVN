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

libFastCompression.a: lzvn_encode.o lzvn_decode.o
	$(AR) $(ARFLAGS) $@ $+
	$(RANLIB) $@

lzvn: libFastCompression.a

clean:
	$(RM) *.o *.a lzvn

install: lzvn
	$(INSTALL) lzvn $(PREFIX)/bin
