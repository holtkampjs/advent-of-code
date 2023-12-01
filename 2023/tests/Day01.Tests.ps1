Describe "Day01" {
	BeforeAll {
		. $PSScriptRoot/../src/Day01/Day01.ps1
	}

	It "Should do something" {
		Get-Data | Should -BeNull
	}
}
