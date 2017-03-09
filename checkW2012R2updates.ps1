$kbhotfix=Get-HotFix | ? {$_.HotFixID -eq 'KB2919355'} | select HotFixID
$hotfix=get-hotfix | measure | select count

$hotfixcounter=$hotfix.count

IF ($kbhotfix -eq $null)
{

  IF ($hotfixcounter -lt 150)
  {
     eventcreate /t error /id 600 /l application /d "Update count is too low"
  }
  IF ($hotfixcounter -ge 150)
  {
     eventcreate /t information /id 601 /l application /d "Update count is ok"
  }

}

