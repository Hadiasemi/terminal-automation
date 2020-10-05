#!/bin/bash

help(){
  echo
  echo "1) publish all files to github."
  echo "2) make new repo."
  echo "3) pull the new update."

}

repo(){
  # create a repo to host a new project on GitHub
  touch README.md
  git init
  git add .
  git commit -m "And so, it begins."
  hub create -p
  # (creates a new GitHub repository with the name of the current directory)
  git push -u origin HEAD

}

add(){
  if  git tag > /dev/null 2>&1 && [ $? -eq 0 ]; then
        if [[ `git status --porcelain` ]]; then
              git add -A
              echo
              echo "Added all the files"
              echo
              read -p "Put your comment: " comment
              echo
              git commit -m "$comment"
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

 pul(){
   git pull
 }

github(){

    echo
    echo ====================================
    echo "            github                "
    echo ====================================

    help
    echo
    echo -n "What option do you want to choose? "
    read num


    case $num in
      1)add
      ;;
      2)repo
      ;;
      3)pul
      ;;
      *)echo
        echo "Invalid option"
        github
      ;;
    esac

}

trap github EXIT
