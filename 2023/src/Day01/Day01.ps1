Import-Module -Name $PSScriptRoot/../AdventOfCodeModule

function Get-Data {
	Get-AdventOfCodeData -Day 1
}

function Convert-StringsToFirstAndLastDigit {
	param (
		[string[]]$CalibrationValues
	)

	foreach ($calibrationValue in $CalibrationValues) {
		Select-String -InputObject $calibrationValue -Pattern "(?<=^\D*)(\d).*(\d)(?=\D*$)" -AllMatches | ForEach-Object { $_.Matches } | ForEach-Object { $_.Groups[1].Value + $_.Groups[2].Value }
	}
}
