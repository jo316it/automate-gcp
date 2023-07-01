resource "null_resource" "shell_script" {
  provisioner "local-exec" {
    command = "bash install.sh"
  }
}