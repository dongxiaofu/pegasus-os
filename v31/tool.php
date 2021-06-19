<?php
$content = file_get_contents('main.c');
preg_match_all("#\[START\]([\s\S]*)\[END\]#", $content, $matchs);
// preg_match_all("#[^.]*#", $content, $matchs);
echo $matchs[1][0];


