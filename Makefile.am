
if WANT_JANSSON
JANSSON_INCLUDES= -I$(top_srcdir)/compat/jansson
else
JANSSON_INCLUDES=
endif

EXTRA_DIST	= example-cfg.json nomacro.pl

SUBDIRS		= compat

bin_PROGRAMS	= svarog

dist_man_MANS	= svarog.1

svarog_SOURCES	= elist.h miner.h compat.h \
		  svarog.c util.c \
		  sha2.c vcrypt.c
if USE_ASM
if ARCH_x86
svarog_SOURCES += sha2-x86.S vcrypt-x86.S
endif
if ARCH_x86_64
svarog_SOURCES += sha2-x64.S vcrypt-x64.S
endif
if ARCH_ARM
svarog_SOURCES += sha2-arm.S vcrypt-arm.S
endif
if ARCH_PPC
svarog_SOURCES += sha2-ppc.S vcrypt-ppc.S
endif
endif
svarog_LDFLAGS	= $(PTHREAD_FLAGS)
svarog_LDADD	= @LIBCURL@ @JANSSON_LIBS@ @PTHREAD_LIBS@ @WS2_LIBS@
svarog_CFLAGS	= -fno-strict-aliasing
svarog_CPPFLAGS	= @LIBCURL_CPPFLAGS@ $(JANSSON_INCLUDES) $(PTHREAD_FLAGS)

