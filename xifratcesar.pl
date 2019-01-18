 #!/usr/bin/perl
  print "Hola, quin es el seu nom?\n";
  $nombre=<STDIN>;
 
  chop($nombre);

  if ($nombre eq "")
  {
    print STDERR 'Que passa?'."\n";
  }
  else 
  {
    print STDOUT "Hola $nombre, comencen \n";
    sleep(1.00);
  } 
head();
menu();
copyright();
sub head {
    print "\n-- == Xifrat Cesar == --\n";
} 
sub copyright {
    print "\n\n-- == Adeu! ;) == --\n";
}
sub menu {
    print qq(
==============
= Menu       =
==============
1 -Xifrar    =
2 -Desxifrar =
3 -Eixir     =
==============
);
    print "\n[+] Tria opció : ";
    chomp( my $op = <stdin> );
    if ( $op eq "3" ) {
        copyright();
        <stdin>;
        exit(1);
    }
    print "\n[+] Introdueix text : ";
    chomp( my $text = <stdin> );
    print "\n[+] Resultat ...\n\n";
    if ( $op eq "1" ) {
        print cifrado_cesar($text);
        <stdin>;
        menu();
    }
    elsif ( $op eq "2" ) {
        print descifrado_cesar($text);
        <stdin>;
        menu();
    }
    else {
        menu();
    }
}
sub cifrado_cesar {
    my @re;
    @letras = split( //, $_[0] );
    for my $letra (@letras) {
        if ( $letra ne " " ) {
            $letrafinal = chr( ord($letra) + 3 );
            $letrafinal =~ s/{/a/;
            $letrafinal =~ s/\|/b/;
            $letrafinal =~ s/}/c/;
            push( @re, $letrafinal );
        }
        else {
            push( @re, " " );
        }
    }
    return @re;
}
sub descifrado_cesar($texto) {
    my @re;
    @letras = split( //, $_[0] );
    for my $letra (@letras) {
        if ( $letra ne " " ) {
            $letrafinal = chr( ord($letra) - 3 );
            $letrafinal =~ s/\^/x/;
            $letrafinal =~ s/_/y/;
            $letrafinal =~ s/`/z/;
            push( @re, $letrafinal );
        }
        else {
            push( @re, " " );
        }
    }
    return @re;
}
# W0lfPV :)
