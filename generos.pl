#!/usr/bin/perl
print "Content-Type: text/html\n\n";
if($ENV{'QUERY_STRING'} eq "") {
    print "<h1>Elige tu genero favorito: </h1>
          <form name=\"search\" method=\"get\" >";
   open F, "/home/elenalimones/generos.txt";
   while(<F>) {
     @campos=split(":");
     $ar{$campos[6]}=$campos[6];
   }
   print "<select name = \"opciones\">";
   for (keys %ar){
     print "<option value=$_";
     print ">$_</option>";
   }
   print "</select>
         <input type=\"submit\" value=\"Elegir\" />";
}else {
   @arGet=split("=",$ENV{'QUERY_STRING'});
   $arGet[1]=~ s/%2F/\//g;
   print "Elegiste $arGet[1]<br>Buen genero, felicidades<br><i></i>";
}
