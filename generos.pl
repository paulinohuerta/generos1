#!/usr/bin/perl
print "Content-Type: text/html; charset=utf-8\n\n";

if($ENV{'QUERY_STRING'} eq "") {
   print "<h1>Bienvenido al formulario. Indique su nombre: </h1>
          <form method=\"get\" >";

print   "<input type=\"text\"  name=\"nombre\" />";
print   "<input type=\"submit\" value=\"Enviar\" />";
}
if($ENV{'QUERY_STRING'} ne "") {
   @arGet=split("=",$ENV{'QUERY_STRING'});
   if ($arGet[0] eq "nombre") {
     $arGet[1]=~ s/%2F/\//g;
     print "<h1>Elija su género de películas favorito </h1>
          <form name=\"search\" method=\"get\" >";
     open F, "/tmp/generos";
     while(<F>) {
      chomp;
      push @ar, $_;
    }
    print "<select name = \"genero\">";
    for (@ar){
     print "<option value=\"$_\"";
     print ">$_</option>";
    }
    print "</select>
         <input type=\"submit\" value=\"Enviar\" />";
   }
   if ($arGet[0] eq "genero") {
       $arGet[1]=~ s/%2F/\//g;
       $arGet[1]=~ s/\+/ /g;
       print "Buena elección la del género de $arGet[1]. Muchas gracias";
   }
}

