#!/usr/bin/perl
print "Content-Type: text/html\n\n";

@pairs = split(/&/, $ENV{QUERY_STRING});

foreach $pair (@pairs) {
   ($name, $value) = split(/=/, $pair);
   $value =~ tr/+/ /;
   $value =~ s/%(..)/pack("C", hex($1))/eg;
   $FORM{$name} = $value;
}

$first_name = $FORM{first_name};
%valores = ( 'comedia','drama','suspense' );

if($first_name == 'comedia' ) {
  print("Podria aconsejarte peliculas como Resacon en las Vegas o Es por tu bien","\n");
}
if($valores{$first_name} == 'drama' ) {
    print("Podria aconsejarte peliculas como Lo imposible o La vida es bella","\n");
}
if($valores{$first_name} == 'suspense' ) {
    print("Podria aconsejarte peliculas como Perdida o El regalo","\n");
}
