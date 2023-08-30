defaults write org.p0deje.Maccy ignoreEvents true
osascript -e "display notification \"Decrypting ${@} password ...\" with title \"Unix Pass\""
#sleep 1
result=$(/opt/homebrew/bin/pass -c ${@})
if [[ $result == "" ]]; then
    result="Insert and unlock your security key."
fi
osascript -e "display notification \"${result}\" with title \"Unix Pass\""
sleep 1
defaults write org.p0deje.Maccy ignoreEvents false
