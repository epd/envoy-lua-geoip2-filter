LUA_PKG		?= luajit-5.1
LUA_CFLAGS	?= -I/build/LuaJIT-2.1.0-beta3/src

CFLAGS ?= -g

maxminddb.so: maxminddb.c
	$(CC) $(CFLAGS) -fPIC -std=c99 $(LUA_CFLAGS) -shared $< -o $@ $(LDFLAGS) -l$(LUA_PKG) -lmaxminddb

clean:
	rm maxminddb.so
