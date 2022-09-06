<?php
// outputs the username that owns the running php/httpd process
// (on a system with the "whoami" executable in the path)
// $output=null;
// $retval=null;
// $result = exec(dirname(__FILE__) . '/echo', $output, $retval);
// echo "Returned with status $retval and output:\n";
// var_dump($output);
// var_dump($result);
// $last_line = system(dirname(__FILE__) . '/echo hello, world', $retval);
$last_line = exec(dirname(__FILE__) . '/echo hello, world', $output, $retval);
var_dump($output);
var_dump($last_line);
