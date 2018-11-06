#!/usr/bin/perl

use CGI;
$query = new CGI;


print $query->header;

print $query->start_html('Datos Personales');
if(!$query->param) {
        print $query->start_form;
        print $query->h1('Introduzca su nombre');
        print $query->textfield('nombre');
        print $query->br;
        print $query->submit;
        print $query->end_form;
        print $query->br;
}
else{
        if (!$query->param('nombre') eq "") {
                print $query->start_form;
                print $query->b('Buenas '),$query->param('nombre');
                print $query->br;
                print $query->start_form;
                print $query->h1('Elige tu genero de cine favorito: ');
                print $query->scrolling_list(-name=>'generos',
                                         -values=>[
                                                   'suspense',
                                                   'terror',
                                                   'comedia',
                                                   'romantica',
                                                   'western',
                                                   'accion',
                                                   'fantasia',
                                                   'otras'],
                                         -size=>8,
                                        -multiple=>'true',
                                        -default=>'Perl');
                print $query->br;
                print $query->submit(-value=>'Enviar genero');
                print $query->endform;
                print $query->br;
        }
}

if (!$query->param('generos') eq ""){
        print $query->h1('Tu genero de cine favorito es: ');
        @generos = $query->param('generos');
        print "<BLOCKQUOTE>\n";
        foreach $generos (@generos) {
                print "$generos<BR>";
   }
        print "</BLOCKQUOTE>\n";
}

print $query->end_html;













