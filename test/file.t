Tests the file command
  $ echo "int main() { return 0; }" > main.c
  $ cc -c main.c
  $ CONAN=../database/ conan.file --mime main.o
  application/x-object
  $ cc main.o
  $ RES=$(CONAN=../database/ conan.file --mime a.out)
  $ test "$RES" = "application/x-pie-executable" || test "$RES" = "application/x-executable"
  $ echo "foo" | gzip -c - > foo.gzip
  $ CONAN=../database/ conan.file --mime foo.gzip
  application/gzip
  $ mkdir tarball
  $ echo "foo" > tarball/foo
  $ tar cf tarball.tar tarball
  $ RES=$(CONAN=../database/ conan.file --mime tarball.tar)
  $ test "$RES" = "application/x-gtar" || test "$RES" = "application/x-ustar"
  $ echo "<html><h1>Hello World!</h1></html>" > index.html
  $ CONAN=../database/ conan.file --mime index.html
  text/html
