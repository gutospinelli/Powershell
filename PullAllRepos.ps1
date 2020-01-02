param (

    # The command you want to perform
    $cmd = "pull"
)

function Go () {

    # Finds all folders by current path  
    $gitFolders = dir -Directory

    ForEach ($gitFolder in $gitFolders) {

        # Gets the FullName to perform the desired command 
        $folder = $gitFolder.FullName 

        Write-Host "Performing git $cmd in folder: '$folder'..." -foregroundColor "green"

        # Go into the folder
        Push-Location $folder 

        # Perform the command within the folder
        & git $cmd

        # Go back to the original folder
        Pop-Location
    }
}

function Main () {  
    Go   
}

# Executes the main function
Main  