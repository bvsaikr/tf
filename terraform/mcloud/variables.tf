# variable "x" {
#     type = string
#     default = "t2.micro"
# }
variable "x" {
    default = "t2.micro"
}
#this default override by tfvars/if we dont have tf vars we can override from cmdline while running apply    
# we are not giving default so it will take frm cmd or if we write tfvars it will take from tfvars
# variable "y" {
#     type = bool
# }
variable "mtype" {
    default = "e2.micro"
}
variable "istrue" {
    type = bool
}
variable "avzone" {
    type = list
    default = ["ap-south-1a","ap-south-1b"]
    #list
}
variable "maps_types" {
    type = map
    default = {
        us-east-1 = "t2.micro",
        ap-south-1 = "t2.nano"
    }
  
}