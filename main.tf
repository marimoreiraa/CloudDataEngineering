#HCL - Hashicorp Configuration Language
#Linguagem declarativa

resource "aws_s3_bucket" "datalake" {
  #Parametros de configuração do recurso escolhido
  bucket = "${var.bucket_name}-${var.environment}"
  acl    = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Name   = "Mariana Duarte",
    IES    = "IGTI",
    Course = "Cloud Data Eng"
  }
}

resource "aws_s3_bucket_object" "texto_teste" {
  bucket = aws_s3_bucket.datalake.id
  key    = "teste/teste.txt"
  acl    = "private"
  source = "teste.txt"
  etag   = filemd5("teste.txt")
}