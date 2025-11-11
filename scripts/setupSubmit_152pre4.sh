#!/bin/bash

# Usage: ./scripts/setupSubmit.sh 152pre4

SHORTREL=$1

if [ -z "$SHORTREL" ]; then
    echo "❌ Usage: $0 <SHORTREL>"
    echo "Example: $0 152pre4"
    exit 1
fi

BASE="151pre3"
INPUT="submit_v45wTT_${BASE}.yaml"
OUTPUT="submit_v45wTT_${SHORTREL}.yaml"

if [ ! -f "$INPUT" ]; then
    echo "❌ Input file $INPUT not found!"
    exit 1
fi

cp "$INPUT" "$OUTPUT"
sed -i "s/${BASE}/${SHORTREL}/g" "$OUTPUT"

echo "✔️  Created $OUTPUT by replacing $BASE → $SHORTREL"
