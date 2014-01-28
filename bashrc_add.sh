
# optional add to your bashrc file

gcd () {
  cd `gls $1 | perl -e '@m=split(/\s+/,<STDIN>);print$m[1]'`
}
