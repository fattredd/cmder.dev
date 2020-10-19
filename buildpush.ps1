
$key = $args[0]

if ($key) {
    #choco pack
    #choco push .\fattredd.cmder.dev.1.3.16.nupkg --source https://push.chocolatey.org/ --api-key $key
} else {
    echo "You need to put in your API key!"
    echo "https://chocolatey.org/account"
}