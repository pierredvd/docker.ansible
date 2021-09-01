## _Environnement de developpement PHP7, Node.js 10, Postgresql 11 dockerisé_

## Contruire le contener
```bash
[Windows] docker build -t dev-ansible:1.00 .
[Linux] sudo docker build -t dev-ansible:1.00 .
 ```

 ## Lancer le conteneur
```bash 
[Windows] docker run -it --rm -m 0.5g --name "dev-ansible_1.00" -v "%cd%/inventory":/etc/ansible/inventory dev-ansible:1.00
[Linux] sudo docker run -it --rm -m 0.5g --name "dev-ansible_1.00" -v "`pwd`/inventory":/etc/ansible/inventory -v dev-ansible:1.00
```