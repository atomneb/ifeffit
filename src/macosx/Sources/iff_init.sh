#!/bin/sh
# set environment for using Ifeffit / iXAFS.app codes

get_abspath() {
    me=${BASH_SOURCE[0]%/}
    if [[ ! $me == */* ]]; then
	me="./"$me
    fi
    abspath=$(cd ${me%/*} && echo $PWD/${0##*/})
    abspath=`dirname ${abspath}`
    return 0
}
append_path() {
  if ! eval test -z "\"\${$1##*:$2:*}\"" -o -z "\"\${$1%%*:$2}\"" -o -z "\"\${$1##$2:*}\"" -o -z "\"\${$1##$2}\"" ; then
    eval "$1=\$$1:$2"
  fi
}


prepend_path() 
{
  if ! eval test -z "\"\${$1##*:$2:*}\"" -o -z "\"\${$1%%*:$2}\"" -o -z "\"\${$1##$2:*}\"" -o -z "\"\${$1##$2}\"" ; then
    eval "$1=$2:\$$1"
  fi
}

get_abspath
local=$abspath/local

local=`dirname $abspath`

prepend_path PATH "$local/bin"

if [ -z "$DYLD_LIBRARY_PATH" ]; then
	DYLD_LIBRARY_PATH="$local/lib"
else
	prepend_path DYLD_LIBRARY_PATH "$local/lib"
fi

if [ -z "$DYLD_FRAMEWORK_PATH" ]; then
	DYLD_FRAMEWORK_PATH="$local/lib"
else
	prepend_path DYLD_FRAMEWORK_PATH "$local/lib"
fi

export PATH DYLD_LIBRARY_PATH  DYLD_FRAMEWORK_PATH


AQUATERM_PATH="$local/bin/AquaTerm.app"
IFEFFIT_DIR="$local/share/ifeffit"
PGPLOT_DEV="/AQT"
PGPLOT_DIR="$local/share/ifeffit/pgplot"

if [ `uname -p` == "i386" ]; then
	PGPLOT_FONT="$BASE/lib/grfont_i386.dat"
else
	PGPLOT_FONT="$BASE/lib/grfont_ppc.dat"
fi

export AQUATERM_PATH IFEFFIT_DIR PGPLOT_DEV PGPLOT_DIR PGPLOT_FONT
