# output "publicip" {
#     value = aws_instance.os.public_ip
    
# }

output "az" {
    value = var.avzone[1]
}
output "az1" {
    value = var.maps_types["ap-south-1"]
}
