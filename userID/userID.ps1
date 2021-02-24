#by Damian Cyrana

function Get-UserID {
    $name = Read-Host -Prompt 'Username or Email address'

    $userID = Get-ADUser -Filter {(Description -like $name) -or (EmailAddress -like $name)}`
                -Properties enabled -Server ...1... -searchbase "...2..." 
}

function Break-Loop {
    $finish = Read-Host -Prompt "Continue searching? [y/n]"

    if($finish -match '[yes]') {
        continue
    } else {
        break
    }
}


#Infinite loop to continue search
while($True) {
    Get-UserID | Format-Table Givenname, Surname, Name -AutoSize
    Break-Loop
}
