$allUsers = Get-Mailbox | Select Identity

ForEach ( $user in $allUsers ) {

    Get-Mailbox | ForEach { 

        If ( $_.Identity -ne $user.Identity ) {

            set-MailboxFolderPermission "$($_.SamAccountName):\calendar" -User $user.Identity -AccessRights  reviewer
            set-MailboxFolderPermission "$($_.SamAccountName):\agenda" -User $user.Identity -AccessRights  reviewer
            Write-Host "$($_.SamAccountName):\calendar added"

        }
    
    }

}

