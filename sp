#!/bin/bash

sp(){
    read -p 'Lab number: ' file
    rsync -avz /Dir/lab$file user@unix2.csc.calpoly.edu:/Dir_School/CPE202

    ssh -t user@unix2.csc.calpoly.edu 'cd /Dir_School/CPE202/;read -p "Lab number: " file; cd lab$file && exec $SHELL'
}
sp
