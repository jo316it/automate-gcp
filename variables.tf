variable project {
  type        = string
  default     = "terraform-gcp-391114"
  description = "Project where the instances will be deployed"
}

variable keys {
  type        = string
  default     = "ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC8cu4J6FGU60cAPXuN5IRB2DkowzCE0p7yeOhy/IvdBIjEOuJEsjEkqL6ZoDQV7c74/WIDKrZnuZi/s1Lupm9+wgEFkvlA4OCDa3xJW5lmBc0BxabQpGL+iLuKlEYxUBPPAJc0NSIoMIbgWkbf8qdoDOrmhUgYEYkgzyzoxy8kqkVvu9B/YpqNDz09cw656rdp/DO9owAcUkLm+28v0LGuRib1eI5sD4SPqWwBsuSaMpzdNwPRNKosB9sYhr1gAlYxvs8wwH5faSoYBWASacgkgyLLuGresSm1AWQRJ+YOo+DbZVfgmHAGiMlYR149e8Hh9ty+ExTiRY+wAGz8IcdXlKkwOEuWDAjvYkC+euNIP93e851NkElzHF1t14FR3hxWGvlX+U5JDyWTC8QY7VPqzjBxHruxKr3fD+Ats8LWKvxuODBeIhtaF2oTvFI1WB9icB1kQxZe8h0Audn1oA9ZO+tMmd0GEkuVr8dT5QNs8O5uzYNFafiW9xBKf5YgM+s= ubuntu"
  
}



variable region {
  type        = string
  default     = "us-east4"
  description = "Define what region the instance gonna be deployed"
}

variable instance_type {

  default = "e2-standard-2"
  description = "Define the type of instance"


}

variable zone {
    default = "us-east4-b"
}

variable os {
  type        = string
  # default     = "projects/centos-cloud/global/images/centos-7-v20230615"
  default = "projects/ubuntu-os-cloud/global/images/ubuntu-2004-focal-v20230628"
}

variable disk_size {

  default     = 30
 
}



