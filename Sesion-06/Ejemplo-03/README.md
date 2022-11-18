# Ejemplo 3 - Proyecto Terraform AWS

## Objetivo 🎯

* Usar terraform para crear recursos básicos en AWS.

## Desarrollo 📝

Los ejemplos del código están en el directorio `../proyecto-tf-aws`.

Terraform es un lenguaje declarativo y su sintaxis básica es:

```<bloque> <tipo> <nombre> { ... }```

Por ejemplo:

```terraform
resource "aws_iam_user" "usr_mark"  {
    name = "mark@email.com"
}
```

En este ejemplo solo necesitamos un archivo, que hemos llamado: ```main.tf``` (📝 El nombre no tiene una función,
puede ser el que sea), y su estructura va de la siguiente forma:

* Un bloque ```terraform```, para configurar el motor de **tf**.

```terraform
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.40.0"
    }
  }
}
```

* Un bloque ```provider```, para configurar el proveedor aws

```terraform
provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}
```

Aquí se define la región donde se gestionarán los recursos y la llave de acceso y su secreto.

* Uno o varios bloques ```resource```, ejemplo de VPC y subnets públicas:

```terraform
resource "aws_vpc" "dev-vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  instance_tenancy     = "default"
  tags = {
    Name        = "dev-vpc"
  }
}

resource "aws_subnet" "dev-subnet-public-1" {
  vpc_id                  = aws_vpc.dev-vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-west-1a"
  tags = {
    Name        = "dev-subnet-public-1"
  }
}
```

En el recurso `aws_vpc` se define la red principal, y algunos de sus parámetros como DNS.

Y finalmente definimos un recurso EC2:

```terraform
resource "aws_instance" "ec2_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.dev-subnet-public-1.id
  tags = {
    Name        = "dev-server-1"
  }
}
```

Este recurso es una máquina virtual de tipo `t2-micro` que entra en el tier gratuito, esta máquina
esta asociada a la subred arriba creada.

En el archivo `variables` se deben declarar las variables que se usarán:

```terraform
variable "region" {
  description = "Location for cloud resources"
}

variable "access_key" {
  description = "Access key to AWS console"
}

variable "secret_key" {
  description = "Secret key to AWS console"
}

variable "ami_id" {
  description = "The AMI to use"
  default     = "ami-09d56f8956ab235b3"
}

variable "instance_type" {
  default = "t2.micro"
}
```

En **tf** existen más tipos de bloques que no utilizaremos en este ejemplo, como `data`, `module` etc.

## Configuración de variables local

Creamos el archivo `terraform.tfvars` con el siguiente contenido:

```terraform
region        = "us-west-1"
access_key    = "CHANGEME"
secret_key    = "CHANGEME"
ami_id        = "ami-03f6d497fceb40069"
instance_type = "t2.micro"
```

Aquí se definen los valores para las variables que usamos.

## Inicializando la configuración

Usamos el comando init para inicializar el proyecto:

```shell
$ terraform init
```

Note que se instalan los plugins para el proveedor de aws.

## Validando la configuración

Antes de poder aplicar esta automatización, debemos asegurarnos que el código es conforme a las
mejores prácticas y debemos realizar una planeación para validar la correcta configuración.

Usamos el comando `validate`:

```shell
$ terraform validate
```

Si no tenemos problemas con sintaxis, realizamos la planeación:

```shell
$ terraform plan
```

Al final nos imprime la salida de los datos del cluster.

## Desplegando lo recursos

Después de que se realizaron las validaciones y la planificación se debe aplicar con el comando:

```shell
$ terraform apply
```

Al final nos imprime la salida de los datos del cluster.

## Manejo de parámetros en tiempo de ejecución

Para definir variables en tiempo de ejecución se usa:

```shell
$ terraform plan -var="access_key=Acc3ssk3Y===++" -var="secret_key=s3cr3tkEy---="
```

**NOTA:** Estas son variables para la conexión al proveedor aws, se deben usar tanto para plan, apply y destroy.

## Limpieza

Para limpiar o destruir los recursos que se generaron ejecutar:

```shell
$ terraform destroy
```
