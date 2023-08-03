variable "x"{
    type = string
    default = "sai"
}
output "myop"{
    value = var.x
}
#anotherway like in between string if we want out variable(string interpolation)
output "myopfromstring"{
    value = "hey im from string ${var.x}"
}