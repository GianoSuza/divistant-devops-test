output "public_ip" {
  value = aws_instance.app_server.public_ip
}

output "backup_bucket" {
  value = aws_s3_bucket.backup.bucket
}