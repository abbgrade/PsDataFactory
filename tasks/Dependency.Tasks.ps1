task InstallBuildDependencies -Jobs {
    Install-Module platyPs -Scope CurrentUser -ErrorAction Stop -Verbose
    Install-Module PsDac -Scope CurrentUser -AllowClobber -ErrorAction Stop -Verbose
}

task InstallTestDependencies -Jobs {
    Install-Module PsDac -Scope CurrentUser -AllowClobber -ErrorAction Stop -Verbose
}

task InstallReleaseDependencies -Jobs {
    Install-Module PsDac -Scope CurrentUser -AllowClobber -ErrorAction Stop -Verbose
}