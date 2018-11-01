#!/usr/bin/perl
print "Content-Type: text/html\n\n";

if($ENV{'QUERY_STRING'} eq "") {
   print "<h1>Bienvenido al formulario. Indique su nombre: </h1>
          <form method=\"get\" >";

print   "<input type=\"text\"  name=\"nombre\" />";
print   "<input type=\"submit\" value=\"Search\" />";
}
if($ENV{'QUERY_STRING'} ne "") {
   @arGet=split("=",$ENV{'QUERY_STRING'});
   if (@arGet[0] eq "nombre") {
   $arGet[1]=~ s/%2F/\//g;
   print "<h1>Elija su genero de peliculas favorito </h1>
          <form name=\"search\" method=\"get\" >";
   open F, "/home/usuario/generos";
   while(<F>) {
     @campos=split(":");
     $ar{$campos[6]}=$campos[6];
   }
   print "<select name = \"shell\">";
   for (keys %ar){
     print "<option value=$_";
     print ">$_</option>";
   }
   print "</select>
         <input type=\"submit\" value=\"Search\" />";
}
}

   if (@arGet[0] eq "shell") {
   $arGet[1]=~ s/%2F/\//g;
   print "De acuerdo. Muchas gracias";
}
