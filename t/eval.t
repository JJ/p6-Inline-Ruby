#!/usr/bin/env perl6

use v6;
use Test;
use Inline::Ruby;

subtest {
  isa-ok !!'true':rb, True;
  isa-ok !!'false':rb, False;
  isa-ok +'5':rb, Int;
  isa-ok +'1.0':rb, Num;
  isa-ok ~'"foo"':rb, Str;
}, 'Ruby to Perl6 types';

is '7 * 6':rb, 42, 'Basic math';

is +'1.0 / 3':rb, (1e0/3), 'Float math';

isa-ok 'Time':rb, Inline::Ruby::RbObject, 'Classes wrapped as RbObject';

is 'Time':rb.now.class, 'Time', 'Call methods';

is '1':rb."+"(7), 8, 'Invoke operator methods';

is '[2, 6, 8, 4]':rb.sort,
   "[2, 4, 6, 8]",
   'Can call sort on Array';

is '[2, 4, 6, 8]':rb.at(1),
   4,
   'Can call parameter methods on Array';

is '[2, 4, 6, 8]':rb.slice(1, 2),
   '[4, 6]',
   'Can call 2-parameter methods on Array';

is '[2, 4, 6, 8]':rb.push(1),
   "[2, 4, 6, 8, 1]",
   'Can modify an Array';

is '[2, 4, 6, 8]':rb.join,
   "2468",
   'Can join an Array';

is '[2, 4, 6, 8]':rb.join(","),
   "2,4,6,8",
   'Can join an Array with comma';

is '[2, 4, 6, 8]':rb.push([:foo]),
   "[2, 4, 6, 8, :foo]",
   'Can modify an Array';

done-testing;


