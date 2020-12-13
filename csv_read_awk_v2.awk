#!/usr/bin/awk
# csv_read_awk.awk
#--------------------------------------------------------------------------------
# Dev: CodeRoninSY
# Date: <2020-12-12>
#--------------------------------------------------------------------------------
# Note: This snippet reads table starting with "SURF|AVGC" and adds all elements
# into an array of two consecutive lines
#--------------------------------------------------------------------------------
# Use this script with "csv_file_4.csv" for better parsing

BEGIN {
    RS = "\n"; FS = " ";
    if ( $0 ~ /^$/ ) {
        split($0, h1, /\s+/)
        for (i in h1) {
            printf "-- %s ", h1[i]
            }; print ";"
    }
}

{

    RS = "\nSURF|\nAVGC"; FS = "\t"; ORS = "\n";
        max = split($0, arr, /\t+|\s+|\n\s+|,/)
        for (i = 1; i <= max; i++) {
            gsub(/^[\s\t\n]+|[\s\t\n]+$/, "", arr[i])
        }

}

{ for (i in arr) { printf "%s ", arr[i] }; print "" }

