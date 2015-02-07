#!/bin/sh

cli=/Applications/Karabiner.app/Contents/Library/bin/karabiner

$cli set parameter.mousekey_repeat_wait_of_pointer 15
/bin/echo -n .
$cli set repeat.wait 20
/bin/echo -n .
$cli set repeat.initial_wait 200
/bin/echo -n .
$cli set parameter.mouse_key_scroll_natural_direction 1
/bin/echo -n .
$cli set parameter.mousekey_initial_wait_of_pointer 15
/bin/echo -n .
$cli set parameter.maximum_speed_of_scroll 40
/bin/echo -n .
$cli set remap.mouse_keys_mode_2 1
/bin/echo -n .
$cli set parameter.maximum_speed_of_pointer 60
/bin/echo -n .
$cli set parameter.mousekey_high_speed_of_pointer 150
/bin/echo -n .
/bin/echo
