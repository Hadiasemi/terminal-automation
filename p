#!/bin/bash

p(){
    read -p 'Project number: ' file
	rsync -avz /Dir/Project$file user@unix2.csc.calpoly.edu:/Dir_School/CPE202
    ssh -t user@unix2.csc.calpoly.edu 'cd /Dir_School/CPE202/;read -p "Project number: " file; cd Project$file && exec $SHELL'
}
p
