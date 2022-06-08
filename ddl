#!/usr/bin/awk -f

!s[$0]++    {print $0; next}
/^[ `}{]*$/ {print $0; next}

#/^ *``` *$/ {print $0; next}
#/^ *$/      {print $0; next}
