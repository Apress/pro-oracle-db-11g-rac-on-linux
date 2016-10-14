#!/bin/bash

ORACLE_HOME=/u01/app/oracle/product/11.2.0/dbhome_1
export LD_LIBRARY_PATH=$ORACLE_HOME/lib:$LD_LIBRARY_PATH

PERLBIN=$ORACLE_HOME/perl/bin/perl

PERLV=`${PERLBIN} -e 'printf "%vd", $^V'`

PERLINC="-I ${ORACLE_HOME}/perl/lib/${PERLV}"
PERLINC="${PERLINC} -I ${ORACLE_HOME}/perl/lib/site_perl/${PERLV}"
PERLINC="${PERLINC} -I ${ORACLE_HOME}/lib"

RUNTHIS="${PERLBIN} -w -T ${PERLINC} dequeue.pl"

# Now run the script with all arguments!
exec ${RUNTHIS} "$@"

