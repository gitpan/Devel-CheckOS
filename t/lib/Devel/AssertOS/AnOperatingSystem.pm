# $Id: AnOperatingSystem.pm,v 1.1 2007/09/30 13:49:17 drhyde Exp $

package Devel::AssertOS::AnOperatingSystem;

use Devel::CheckOS qw(die_unsupported);

$VERSION = '1.0';

sub os_is { 1; }

die_unsupported() unless(os_is());

1;
