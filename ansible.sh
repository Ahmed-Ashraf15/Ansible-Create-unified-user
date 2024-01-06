#!/bin/bash

# generate public key from private one

echo -n "enter the private key path: "
read key_path

if [ -e "./public_key.pem" ]; then
    echo "File 'public_key.pem' already exists. Skipping creation."
else
    ssh-keygen -f ./$key_path.pem -y > ./public_key.pem
    echo "File 'public_key.pem' created."
fi


# run ansible playbook with root user 

echo -n 'enter the path of file: '
read file_name

echo -n 'enter the root user '
read remote_user  

ansible-playbook ./$file_name.yaml -u $remote_user
