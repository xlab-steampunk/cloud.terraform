# TODO: update ansible provider url 
terraform {
  required_providers {
    ansible = {
      version = "~> 0.0.1"
      source  = "terraform-ansible.com/ansibleprovider/ansible"
    }
  }
}

resource "ansible_host" "host" {
  host_name = "somehost"
  groups = ["somegroup", "anothergroup"]
  variables = {
    host_hello = "from host!"
    host_variable = 7
  }
}

resource "ansible_host" "anotherhost" {
  host_name = "anotherhost"
  groups = ["somechild"]
  variables = {
    host_hello = "from anotherhost!"
    host_variable = 5
  }
}

resource "ansible_host" "ungrupedhost" {
  host_name = "ungrupedhost"
}

resource "ansible_group" "group" {
  group_name = "somegroup"
  children = ["somechild", "anotherchild"]
  variables = {
    group_hello = "from group!",
    group_variable = 11
  }
}

resource "ansible_group" "childlessgroup" {
  group_name = "childlessgroup"
}