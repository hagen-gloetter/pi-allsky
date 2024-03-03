<html>
<body>
<h1>
Host: 
<?php  
$hostname1 = gethostname(); 
$hostname2 = getenv('HTTP_HOST');

echo "<a href='http://$hostname2'>$hostname1</a> "; 
?>
</h1>

<?php
  $cmd="cd /srv/zeitraffer/ ; /usr/bin/find /srv/zeitraffer/  -type f | xargs ls -tr | tail -n 1 | tr -d '\n'";
  $cmd="cd /srv/zeitraffer/ ; find /srv/zeitraffer/$1 -type f | xargs stat --format '%Y :%y %n' | sort -nr | cut -d ' ' -f5 | head -n 1 | tr -d '\n'";
  $latestpic = shell_exec($cmd);
  $cmd="rm latest.jpg ; touch mytime " ;
  $link = shell_exec($cmd);
  $cmd= "ln -s $latestpic latest.jpg";
  $link = shell_exec($cmd);
  echo "<p>Image: <b>$latestpic</b></p>";
  echo "<img src='latest.jpg' alt='$latestpic' title='$latestpic' >";
  
?>

</body>
</html>

