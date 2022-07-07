#!/bin/bash

cloud-nuke aws --resource-type iam --config in1.yml --force --region global

array=(0522C1
0522C7
)

for i in "${array[@]}"

do
rm $i.txt
echo "----------------------" >> $i.txt
echo "Link a la consola de AWS" >> $i.txt
echo "https://117162570486.signin.aws.amazon.com/console" >> $i.txt
echo "----------------------" >> $i.txt

	for a in {1..10}

	do
		password=$(pwgen 8 1)
		user="$i-grupo$a"
		aws iam create-user --user-name $user
		aws iam create-login-profile --user-name $user --password $password
		aws iam attach-user-policy --policy-arn arn:aws:iam::aws:policy/AdministratorAccess --user-name $user
		aws iam create-access-key --user-name $user >/root/cred.json
		echo "Usuario:"$user >> $i.txt
                echo "Contraseña":$password >> $i.txt
		echo "AccessKeyId" >> $i.txt
		jq .AccessKey.AccessKeyId cred.json >> $i.txt
		echo "SecretAccessKey" >> $i.txt
		jq .AccessKey.SecretAccessKey cred.json >> $i.txt
                echo "----------------------" >> $i.txt

	done

done
