#!/usr/bin/env perl
use strict;
use warnings;

use XML::Twig;

sub compare_by_identity {
   my ( $first, $second ) = @_;
   foreach my $identity ( $first->get_xpath('//Identity') ) {
      my $id = $identity->first_child_text('Id');

      print $id, "\n";
      my $compare_to =
        $second->get_xpath( "//Identity/Id[string()=\"$id\"]/..", 0 );
      if ($compare_to) {
         print "Matching element found for ID $id\n";
         foreach my $element ( $identity->children ) {
            my $tag  = $element->tag;
            my $text = $element->text;
            if ( not $element->text eq $compare_to->first_child_text($tag) ) {
               print "$id, $tag has value $text which doesn't match: ",
                 $compare_to->first_child_text($tag), "\n";
            }
         }
      }
      else {
         print "No matching element for Id $id\n";
      }
   }
}

my $first_file  = XML::Twig->new->parsefile('test1.xml');
my $second_file = XML::Twig->new->parsefile('test2.xml');

compare_by_identity( $first_file,  $second_file );
compare_by_identity( $second_file, $first_file );

