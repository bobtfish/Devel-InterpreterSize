use strict;
use warnings;
use inc::Module::Install;
use Config;

all_from 'lib/Devel/InterpreterSize.pm';
license 'apache2';

resources(
    repository => "git://github.com/bobtfish/Devel-InterpreterSize.git",
);

requires 'Class::Load';

if ($Config{'osname'} =~ /(?:darwin|bsd|aix)/i) {
    requires 'BSD::Resource';
}
if ($Config{'osname'} eq 'linux') {
    requires 'Linux::Pid';
}

test_requires 'Test::More' => '0.88';

if ($Module::Install::AUTHOR) {
    system("pod2text lib/Devel/InterpreterSize.pm > README")
        and die $!;
}

WriteAll;


