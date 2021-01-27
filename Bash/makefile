CC		=gcc
CFLAGS		=-g
OUPUT_OPTION	=-MMD -MP -o $@

SOURCE		=$(wildcard *10.c)
OBJS		=$(SOURCE:.c=.o)
DEPS		=$(source:.c=.d)
-include ${DEPS}

ex10: ${OBJS}
	${CC} -o ex10 ${OBJS}
etags:
	etags *.c *.h
