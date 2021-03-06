#!/bin/bash
github(){
    
    echo
    echo ====================================
    echo "            github                "
    echo ====================================
    if  git tag > /dev/null 2>&1 && [ $? -eq 0 ]; then
        # echo "Exit with ctrl-c"
         #trap "  EXIT;" EXIT
         if [[ `git status --porcelain` ]]; then
            git add -A
            echo
            echo "Added all the files"
            echo
            read -p "Put your comment: " comment
             echo
            git commit -m "$comment"

            if ! git diff --quiet remotes/origin/HEAD; then
                 git pull  --rebase
            fi
            git push

            echo
            echo "Done"
            echo
         else
             echo
             echo "No Changes"
             echo
         fi
    else
        echo
        echo "this is NOT a git repo"
        echo
    fi

}
trap github EXIT
