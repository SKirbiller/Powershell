$group = get-adgroupmember 'GroupeAD'

$i = 0

foreach ($item in $group)
{
	$user = $item.name
	
	Try
	{
		$info = Get-ADuser -Identity $item -Properties GivenName
		Write-Host $user "," $info.givenname "," $info.surname
		$i = $i+1
	}
	Catch
	{
		Write-Host $user
	}
	
}

Write-Host $i
