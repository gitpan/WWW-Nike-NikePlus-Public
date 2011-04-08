# $Id: new.t 7549 2011-04-08 17:30:01Z jonasbn $

use strict;
use warnings;
use WWW::Nike::NikePlus::Public;
use Test::More tests => 4;

my $nike;

ok($nike = WWW::Nike::NikePlus::Public->new());

isa_ok($nike, 'WWW::Nike::NikePlus::Public');

ok($nike = WWW::Nike::NikePlus::Public->new({ userid => 1755202461 }));

isa_ok($nike, 'WWW::Nike::NikePlus::Public');
