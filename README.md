# About

This is a terraform module that provisions security groups meant to be restrict network access to an etcd cluster.

The following security groups are created:
- member: Security group for members of the etcd cluster. It can make external requests and communicate with other members of the **member** group on port **2380**
- client: Security group for any machine that needs to talk to the etcd cluster as a client. It can communicate with any member of the **member** group on port **2379** and send them **icmp** traffic as well.
- bastion: Security group to any machine that needs **ssh** access to the cluster. It can communicate with any member of the **member** group on port **22** and send them **icmp** traffic as well. I can also make any external request, receive external **icmp** traffic and receive external requests on port **22**.

The **member** and **bastion** security groups are self-contained. They can be applied by themselves on vms with no other security groups and the vms will be functional in their role.

The **client** security group is meant to supplement other security groups a vm will have as the only thing it grants is client access to the etcd cluster.

# Usage

## Variables

The module takes the following variables as input:

- namespace: Namespace to differenciate the security group names across etcd clusters. The generated security groups will have the following names: 

```
etcd-member-<namespace>
etcd-client-<namespace>
etcd-bastion-<namespace>
```

## Output

The module outputs the following variables as output:

- groups: A map with 3 keys: client, member, bastion. Each key map entry contains a resource of type **openstack_networking_secgroup_v2**