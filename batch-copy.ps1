param([string] $Pattern = "test",
      [string] $Ext = "*")
Get-ChildItem -Filter $Ext |
Foreach-Object {
    $contents = Get-Content $_
    #$contents
    $match = Select-String -Pattern $Pattern $_ -Quiet
    $match
    if ($match) {
        Copy-Item -Path $_ -Destination .\output\$_
    }
}

#usage: ./batch-copy.ps1 -Pattern "your pattern" -Ext="*.txt"
