$getGroupAdUser = Get-ADPrincipalGroupMembership 'userXXX' | select name
$i = 0

foreach ($item in $getGroupAdUser)
{
	Write-Host $item
	$i = $i+1
}

Write-Host $i