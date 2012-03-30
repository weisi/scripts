#!/bin/bash
#
# Written by multiple1902 <multiple1902@gmail.com>
# Released under MIT License
#
# gpghtml.sh:
#   Sign a HTML page in cleartext using gnupg
#
# Usage:
#   gpghtml.sh happyhour.html
#
# Requirements:
#   gnupg
#


if [ -z "$1" ]; then
    echo "gpghtml: please specify input file";
    exit 126
fi

TMPFILE=$(mktemp)
DEST=$(dirname "$1")/$(basename "$1" .html).signed.html

cat > "$TMPFILE" << EOF

-->
EOF

cat "$1" >> "$TMPFILE"

cat >> "$TMPFILE" << EOF

<!--
EOF

if gpg --clearsign "$TMPFILE"; then

    cat > "$DEST" << EOF
<!--
EOF

    cat >> "$DEST" < "$TMPFILE.asc"

    cat >> "$DEST" << EOF
-->
EOF

    rm "$TMPFILE" "$TMPFILE.asc"

    echo "gpghtml: succ"

else

    rm "$TMPFILE"
    echo "gpghtml: gpg failed to sign the file"
    return 125

fi
