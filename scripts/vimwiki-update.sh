commitMsg="updated vimiki"
while getopts m: opt
	do
	    case "$opt" in
	        m) commitMsg=$OPTARG;;
	    esac
	done
cd ~/vimwiki/ &&
nvim -c VimwikiAll2HTML -c q ~/vimwiki/index.wiki &&
git add . &&
git commit -m "$commitMsg" && 
git push
    
