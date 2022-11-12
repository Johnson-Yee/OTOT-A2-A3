set -B                  # enable brace expansion
for i in {1..1000}; do
  curl -s -k 'GET' -H 'header info' -b 'stuff' 'http://localhost/app'
done