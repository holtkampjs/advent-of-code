# Hello World

function Get-HelloWorld {
	param (
		[string]$Name = 'World'
	)
	"Hello, $Name!"
}

function Get-WebRequestSessionForAdventOfCode {
	$session = New-Object Microsoft.PowerShell.Commands.WebRequestSession
	$session.UserAgent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36 Edg/119.0.0.0"
	$session.Cookies.Add((New-Object System.Net.Cookie("_ga", "GA1.2.1141629953.1698846841", "/", ".adventofcode.com")))
	$session.Cookies.Add((New-Object System.Net.Cookie("session", "53616c7465645f5f826c6c1f78f74cd1ec892e9958ba377a7cc78f295c18aad687e67903cfe101c28c2d7606212167014e34f78222fa57b04ee3c7c44c0c41ed", "/", ".adventofcode.com")))
	$session.Cookies.Add((New-Object System.Net.Cookie("_gid", "GA1.2.599602007.1701358047", "/", ".adventofcode.com")))
	$session.Cookies.Add((New-Object System.Net.Cookie("ssm_au_c", "kenYQAG3i9foz9RiB5vKCKMItIRM/EiMhR5HuWkvDwOMgAAAAtPkxrYSzm4dhFLx+dUGwT5dieGY9sBuGw/hP7ty661Q=", "/", ".adventofcode.com")))
	$session.Cookies.Add((New-Object System.Net.Cookie("_ga_MHSNPJKWC7", "GS1.2.1701445797.4.0.1701445797.0.0.0", "/", ".adventofcode.com")))

	return $session
}

function Get-WebRequestHeadersForAdventOfCode {
	param (
		[int]$Day
	)

	return @{
		"Accept"="text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7"
		"Accept-Encoding"="gzip, deflate, br"
		"Accept-Language"="en-US,en;q=0.9"
		"Cache-Control"="max-age=0"
		"Referer"="https://adventofcode.com/2023/day/$Day"
		"Sec-Fetch-Dest"="document"
		"Sec-Fetch-Mode"="navigate"
		"Sec-Fetch-Site"="same-origin"
		"Sec-Fetch-User"="?1"
		"Upgrade-Insecure-Requests"="1"
		"sec-ch-ua"="`"Microsoft Edge`";v=`"119`", `"Chromium`";v=`"119`", `"Not?A_Brand`";v=`"24`""
		"sec-ch-ua-mobile"="?0"
		"sec-ch-ua-platform"="`"Windows`""
	}
}

function Get-AdventOfCodeData {
	param (
		[int]$Day
	)

	$options = @{
		UseBasicParsing = $true
		Uri = "https://adventofcode.com/2023/day/$Day/input"
		WebSession = Get-WebRequestSessionForAdventOfCode
		Headers = Get-WebRequestHeadersForAdventOfCode -Day $Day
		OutFile = "$PSScriptRoot/../Day{0:D2}/input.txt" -f $Day
	}

	Invoke-WebRequest @options
}
