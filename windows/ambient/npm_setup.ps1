
# ---------------------- things to modify

$apps = @(
@{name="empty-trash-cli"}
@{name="neovim"}
@{name="yarn"}
@{name="live-server"}
@{name="tree-sitter-cli"}
)

# ----------------------- setup functions
$DesktopPath = [System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::Desktop)

function check_fnm{
    Try{
    fnm --version
    }
    Catch{
    scoop install fnm
    fnm install --lts
    }
}

function npm_g_install {
        Write-Host -ForegroundColor Green "Installing npm pkgs"
        Foreach ($app in $apps){
                npm install --global $app.name
                if ($LASTEXITCODE -eq 0) {
                        Write-Host -ForegroundColor Green $app.name "successfully installed."
                    }
            }
    }

### Get List of installed Apps ###
function get_list {
    $timestamp = get-date -Format dd_MM_yyyy
    $newPath = "$DesktopPath\" + "npm_"+ $env:computername + "_$timestamp" + ".txt"
    Write-Host -ForegroundColor Yellow "Generating Applist..."
    npm list -g --depth=0 > $newPath
    Write-Host -ForegroundColor Magenta "List saved on $newPath"
    Pause
}


# npm list -g --depth=0 #listed global installed packages local

# ----------------------- execute

check_fnm
npm_g_install
get_list
