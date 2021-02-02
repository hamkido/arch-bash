function dedupHistory() {	
    cp ~/.zsh_history{,-old}	
    tmpzshhistory=`~/tmp/zsh_history`	
    awk -F ";" '!seen[$2]++' ~/.zsh_history > $tmpFile	
    mv $tmpzshhistory ~/.zsh_history	
}
