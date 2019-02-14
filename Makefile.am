
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
		  cpu-miner.c util.c \
		  sha2.c vcrypt.c
if USE_ASM
if ARCH_x86
minerd_SOURCES += sha2-x86.S vcrypt-x86.S
endif
if ARCH_x86_64
minerd_SOURCES += sha2-x64.S vcrypt-x64.S
endif
if ARCH_ARM
minerd_SOURCES += sha2-arm.S vcrypt-arm.S
endif
if ARCH_PPC
minerd_SOURCES += sha2-ppc.S vcrypt-ppc.S
endif
endif
minerd_LDFLAGS	= $(PTHREAD_FLAGS)
minerd_LDADD	= @LIBCURL@ @JANSSON_LIBS@ @PTHREAD_LIBS@ @WS2_LIBS@
minerd_CFLAGS	= -fno-strict-aliasing
minerd_CPPFLAGS	= @LIBCURL_CPPFLAGS@ $(JANSSON_INCLUDES) $(PTHREAD_FLAGS)

