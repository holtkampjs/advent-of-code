Import-Module -Name $PSScriptRoot/../AdventOfCodeModule

function Get-ScratchcardScore {
	param ([string]$Scratchcard)
	
	$splitString = $Scratchcard -split "\|"
	
	$winningNumbers = $splitString[0] -split " " | where { $_ -match "\d+" }
	$myNumbers = $splitString[1] -split " " | where { $_ -match "\d+" }

	$myWinningNumbers = $myNumbers | Where-Object { $_ -in $winningNumbers }

	if ($myWinningNumbers.Count -gt 0) {
		return [Math]::Pow(2, $myWinningNumbers.Count - 1)
	}
	return 0
}

function Get-ScratchcardScores {
	param ([string[]]$Data)

	$scores = foreach ($card in $Data) {
		Get-ScratchcardScore -Scratchcard $card
	}

	$scores | Measure-Object -Sum
}

$data = Get-AdventOfCodeData -Day 4

Get-ScratchcardScores -Data $data
