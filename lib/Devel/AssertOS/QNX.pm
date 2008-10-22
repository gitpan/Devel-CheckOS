# $Id: QNX.pm,v 1.1 2008/10/22 19:10:52 drhyde Exp $

package Devel::AssertOS::QNX;

use Devel::CheckOS;

$VERSION = '1.0';

sub os_is {
    Devel::CheckOS::os_is('QNX::v4') ||
    Devel::CheckOS::os_is('QNX::Neutrino')
}

Devel::CheckOS::die_unsupported() unless(os_is());

=head1 COPYRIGHT and LICENCE

Copyright 2007 - 2008 David Cantrell

This software is free-as-in-speech software, and may be used, distributed, and modified under the terms of either the GNU General Public Licence version 2 or the Artistic Licence. It's up to you which one you use. The full text of the licences can be found in the files GPL2.txt and ARTISTIC.txt, respectively.

=cut

1;
