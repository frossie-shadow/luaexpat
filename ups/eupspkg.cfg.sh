# EupsPkg config file. Sourced by 'eupspkg'

# Breaks on Darwin w/o this
export LANG=C

config()
{
    sed -i "s,LUA_LIBDIR= /usr/local/,LUA_LIBDIR= $LUA_DIR/," config &&
    sed -i "s,LUA_DIR= /usr/local/,LUA_DIR= ${LUA_DIR}/," config &&
    sed -i "s,LUA_INC= /usr/local/,LUA_INC= ${LUA_DIR}/," config &&
    sed -i "s,5\.0,5\.1," config &&
    sed -i "s,-O2,-O2 -fPIC," config &&
    sed -i "s,LUA_VERSION_NUM= 500,LUA_VERSION_NUM= 514," config &&
    sed -i -r "s,EXPAT_INC= /usr/local/(.*),EXPAT_INC=${EXPAT_DIR}/\1\nEXPAT_LIBDIR=${EXPAT_DIR}/lib," config && 
    sed -i "s,-lexpat,-L\\\$\\(EXPAT_LIBDIR\\) -lexpat," makefile

    # Don't be explicit about which compiler to use
    sed -i '.prev' "s,^CC = \(.*\),," config
}
