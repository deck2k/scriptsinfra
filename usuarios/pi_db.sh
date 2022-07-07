#!/bin/bash



array=(0621_C1_DB
0621_C2_DB
0621_C5_DB
0821_C1_DB
)
rm script.sql

for i in "${array[@]}"

do

rm $i.txt
echo "----------------------" >> $i.txt
echo "Endpoint de Base de Datos" >> $i.txt
echo "proyectointegrador.c7upsyttprwl.sa-east-1.rds.amazonaws.com" >> $i.txt
echo "----------------------" >> $i.txt

	for a in {1..11}

	do
		password=$(pwgen 8 1)
		user=$i"_GRUPO"$a
		echo "Base de Datos:" $user >>$i.txt
		echo "Usuario:"$user >>$i.txt
		echo "Contraseña:"$password >>$i.txt
		echo "CREATE USER ''"$user"''@''%'' IDENTIFIED BY ''"$password"'';" >> script.sql
		echo "CREATE DATABASE "$user";" >> script.sql
                echo "GRANT SELECT, INSERT, CREATE, ALTER, DROP, LOCK TABLES, CREATE TEMPORARY TABLES, DELETE, UPDATE, EXECUTE ON "$user".* TO ''"$user"''@''%'';" >> script.sql
                echo "----------------------" >> $i.txt

	done

done


