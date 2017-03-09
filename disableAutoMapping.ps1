# Remove mailbox permission

Remove-MailboxPermission -Identity "eta@eota.eu" -User "carlos*" -AccessRights Full



# add mailbox persmission auto mapping disabled

add-MailboxPermission -Identity "eta@eota.eu" -User "carlos*" -AccessRights Full -InheritanceType all -AutoMapping $false

#bulk remove

$FixAutoMapping = Get-MailboxPermission gnb-eota |where {$_.AccessRights -eq "FullAccess" -and $_.IsInherited -eq $false}
$FixAutoMapping | Remove-MailboxPermission
$FixAutoMapping | ForEach {Add-MailboxPermission -Identity $_.Identity -User $_.User -AccessRights:FullAccess -AutoMapping $false} 