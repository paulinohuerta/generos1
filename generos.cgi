#!/usr/bin/perl

use CGI;
$query = new CGI;

print $query->header;
print $query->start_html('SCRIPT USANDO MODULO CGI');
if(!$query->param) {
	print $query->start_form;
      	print $query->h1('Bienvenido. Introduzca su nombre');
	print $query->textfield('nombre');
	print $query->br;
      	print $query->submit;
      	print $query->end_form;
      	print $query->br;
}
