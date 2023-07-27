# About

This is a terraform module that provisions security groups meant to be restrict network access to an etcd cluster.

The following security group is created:
- **member**: Security group for members of the etcd cluster. It can make external requests and communicate with other members of the **member** group on port **2380**

Additionally, you can pass a list of groups that will fulfill each of the following roles:
- **bastion**: Security groups that will have access to the etcd servers on port **22** as well as icmp traffic.
- **client**: Security groups that will have access to the etcd servers on port **2379** as well as icmp traffic.
- **metrics_server**: Security groups that will have access to the etcd servers on port **2379**, port *9100** as well as icmp traffic.

# Usage

## Variables

The module takes the following variables as input:

- **member_group_name**: Name to give to the security group for the etcd members
- **client_group_ids**: List of ids of security groups that should have **client** access to the etcd cluster
- **bastion_group_ids**: List of ids of security groups that should have **bastion** access to the etcd cluster
- **metrics_server_group_ids**: List of ids of security groups that should have **metrics server** access to the etcd cluster.

## Output

The module outputs the following variables as output:

- **member_group**: Security group for the etcd members that got created. It contains a resource of type **openstack_networking_secgroup_v2**