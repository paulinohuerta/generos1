#!/usr/bin/perl
print "Content-Type: text/html\n\n";

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
     print "<h1>Elija su genero de peliculas favorito </h1>
          <form name=\"search\" method=\"get\" >";
     open F, "/home/elenalimones/generos";
     while(<F>) {
      @campos=split(":");
      $ar{$campos[1]}=$campos[1];

    }
    print "<select name = \"genero\">";
    for (keys %ar){
     print "<option value=$_";
     print ">$_</option>";
    }
    print "</select>
         <input type=\"submit\" value=\"Enviar\" />";
   }
   if ($arGet[0] eq "genero") {
       $arGet[1]=~ s/%2F/\//g;
       print "Buena eleccion la del genero de $arGet[1]. Muchas gracias";
   }
}
