output "groups" {
  value = {
    member = openstack_networking_secgroup_v2.etcd_member
    client = openstack_networking_secgroup_v2.etcd_client
    bastion = openstack_networking_secgroup_v2.etcd_bastion
  }
}