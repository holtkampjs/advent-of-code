# Load the module (adjust the path as needed)
$modulePath = Join-Path $PSScriptRoot '..\src\AdventOfCodeModule\AdventOfCodeModule.psm1'
Import-Module $modulePath -Force

Describe "AdventOfCodeModule" {
    It 'should return "Hello, World!"' {
        $result = Get-HelloWorld
        $result | Should -Be 'Hello, World!'
    }
}
