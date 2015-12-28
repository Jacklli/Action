CFLAGS += -g -I ./net/ -I ./db/ -I ./ -I ./log/
HEADER = ./net/event.h ./net/aepoll.h ./net/tcpsocket.h \
        ./net/conn.h ./net/timer.h ./net/buffer.h ./net/rbtree.h ./net/codec.h ./db/object.h ./db/dict.h ./db/execcommand.h ./log/log.h ./server.h
BODY = server.c ./net/event.c ./net/aepoll.c ./net/tcpsocket.c \
        ./net/conn.c ./net/timer.c ./net/buffer.c ./net/rbtree.c ./net/codec.c ./db/dict.c ./db/object.c ./db/execcommand.c ./log/log.c
server.o: ./net/event.o ./net/aepoll.o ./net/tcpsocket.o ./net/conn.o ./net/timer.o ./net/codec.o ./db/dict.o ./db/object.o ./db/execcommand.o ./log/log.o
	gcc $(CFLAGS) -g -o server.o $(BODY) -lpthread
clean:
	rm -rf *.o net/*.o db/*.o log/*.o *.log core* server.log.*
corev:
	rm -rf core*
