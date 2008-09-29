use strict;
$^W = 1;

use Test::More tests => 11;

BEGIN { use_ok('Devel::CheckOS'); }

use File::Spec;
use lib File::Spec->catdir(qw(t lib));

ok(Devel::CheckOS::os_is('AnOperatingSystem'),
   "a single valid OS detected");
ok(Devel::CheckOS::os_isnt('NotAnOperatingSystem'),
   "a single invalid OS detected");

eval { Devel::CheckOS::die_if_os_isnt('AnOperatingSystem') };
ok(!$@, "a single valid OS detected using die_if_os_isnt");
eval { Devel::CheckOS::die_if_os_is('AnOperatingSystem') };
ok($@ =~ /OS unsupported/i, "a single valid OS detected using die_if_os_is");

eval { Devel::CheckOS::die_if_os_is('NotAnOperatingSystem') };
ok(!$@, "a single invalid OS detected using die_if_os_is");
eval { Devel::CheckOS::die_if_os_isnt('NotAnOperatingSystem') };
ok($@ =~ /OS unsupported/i, "a single invalid OS detected using die_if_os_isnt");

eval { Devel::CheckOS::die_unsupported() };
ok($@ =~ /OS unsupported/i, "die_unsupported works");

ok((grep { /^AnOperatingSystem$/i } Devel::CheckOS::list_platforms()) &&
   (grep { /^NotAnOperatingSystem$/i } Devel::CheckOS::list_platforms()),
   "list_platforms works");

eval "use lib File::Spec->catdir(qw(t otherlib))";
sleep(2);
utime time(), time(), File::Spec->catfile(qw(t otherlib Devel AssertOS AnOperatingSystem.pm));

ok(1 == (grep { /^AnOperatingSystem$/i } Devel::CheckOS::list_platforms()),
   "A platform is listed only once");
ok(Devel::CheckOS::list_platforms->{AnOperatingSystem} eq
   File::Spec->catfile(qw(t otherlib Devel AssertOS AnOperatingSystem.pm)),
   "scalar list_platforms gives the most recent module for an OS");
