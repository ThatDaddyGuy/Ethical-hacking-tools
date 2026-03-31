#!/bin/bash

# ==============================
# Robots.txt Grabber (Ethical)
# ==============================

TARGET="$1"
OUTFILE="$2"

if [[ -z "$TARGET" ]]; then
  echo "Usage: $0 <domain> [output_file]"
  echo "Example: $0 example.com robots.txt"
  exit 1
fi

# Normalize URL
if [[ "$TARGET" != http* ]]; then
  URL="https://$TARGET/robots.txt"
  FALLBACK="http://$TARGET/robots.txt"
else
  URL="$TARGET/robots.txt"
  FALLBACK=""
fi

echo "======================================"
echo " Robots.txt Grabber"
echo " Target: $TARGET"
echo "======================================

# Try HTTPS first
HTTP_STATUS=$(curl -s -o /tmp/robots.txt -w "%{http_code}" "$URL")

if [[ "$HTTP_STATUS" != "200" && -n "$FALLBACK" ]]; then
  echo "[!] HTTPS failed, trying HTTP..."
  HTTP_STATUS=$(curl -s -o /tmp/robots.txt -w "%{http_code}" "$FAL>
  URL="$FALLBACK"
fi

if [[ "$HTTP_STATUS" != "200" ]]; then
  echo "[-] robots.txt not found (HTTP $HTTP_STATUS)"
  ex

