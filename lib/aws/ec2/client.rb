# Copyright 2011-2012 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License"). You
# may not use this file except in compliance with the License. A copy of
# the License is located at
#
#     http://aws.amazon.com/apache2.0/
#
# or in the "license" file accompanying this file. This file is
# distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF
# ANY KIND, either express or implied. See the License for the specific
# language governing permissions and limitations under the License.

module AWS
  class EC2

    # Client class for Amazon Elastic Compute Cloud (EC2).
    class Client < Core::Client

      API_VERSION = '2012-07-20'

      extend Core::QueryClient

      # @private
      CACHEABLE_REQUESTS = Set[
        :describe_addresses,
        :describe_availability_zones,
        :describe_bundle_tasks,
        :describe_customer_gateways,
        :describe_dhcp_options,
        :describe_image_attribute,
        :describe_images,
        :describe_instances,
        :describe_key_pairs,
        :describe_regions,
        :describe_reserved_instances,
        :describe_reserved_instances_offerings,
        :describe_security_groups,
        :describe_snapshot_attribute,
        :describe_snapshots,
        :describe_subnets,
        :describe_volume_status,
        :describe_volumes,
        :describe_vpcs,
        :describe_vpn_connections,
        :describe_vpn_gateways,
        :describe_instance_attribute,
        :describe_spot_instance_requests,
        :describe_spot_price_history,
        :describe_spot_datafeed_subscription,
        :describe_licenses,
        :describe_placement_groups,
        :describe_tags,
        :describe_internet_gateways,
        :describe_route_tables,
        :describe_network_acls,
        :describe_instance_status,
        :describe_conversion_tasks,
        :describe_network_interfaces,
        :describe_network_interface_attribute,
      ]

      ## client methods ##

      # Calls the ActivateLicense API operation.
      # @method activate_license(options = {})
      # @param [Hash] options
      #   * +:license_id+ - *required* - (String) Specifies the ID for the
      #     specific license to activate against.
      #   * +:capacity+ - *required* - (Integer) Specifies the additional
      #     number of licenses to activate.
      # @return [Core::Response]
      define_client_method :activate_license, 'ActivateLicense'

      # Calls the AllocateAddress API operation.
      # @method allocate_address(options = {})
      # @param [Hash] options
      #   * +:domain+ - (String) Set to vpc to allocate the address to your
      #     VPC. By default, will allocate to EC2.
      # @return [Core::Response]
      define_client_method :allocate_address, 'AllocateAddress'

      # Calls the AssignPrivateIpAddresses API operation.
      # @method assign_private_ip_addresses(options = {})
      # @param [Hash] options
      #   * +:network_interface_id+ - *required* - (String)
      #   * +:private_ip_addresses+ - (Array<String>)
      #   * +:secondary_private_ip_address_count+ - (Integer)
      #   * +:allow_reassignment+ - (Boolean)
      # @return [Core::Response]
      define_client_method :assign_private_ip_addresses, 'AssignPrivateIpAddresses'

      # Calls the AssociateAddress API operation.
      # @method associate_address(options = {})
      # @param [Hash] options
      #   * +:instance_id+ - (String) The instance to associate with the IP
      #     address.
      #   * +:public_ip+ - (String) IP address that you are assigning to the
      #     instance.
      #   * +:allocation_id+ - (String) The allocation ID that AWS returned
      #     when you allocated the elastic IP address for use with Amazon VPC.
      #   * +:network_interface_id+ - (String)
      #   * +:private_ip_address+ - (String)
      #   * +:allow_reassociation+ - (Boolean)
      # @return [Core::Response]
      define_client_method :associate_address, 'AssociateAddress'

      # Calls the AssociateDhcpOptions API operation.
      # @method associate_dhcp_options(options = {})
      # @param [Hash] options
      #   * +:dhcp_options_id+ - *required* - (String) The ID of the DHCP
      #     options to associate with the VPC. Specify "default" to associate
      #     the default DHCP options with the VPC.
      #   * +:vpc_id+ - *required* - (String) The ID of the VPC to associate
      #     the DHCP options with.
      # @return [Core::Response]
      define_client_method :associate_dhcp_options, 'AssociateDhcpOptions'

      # Calls the AssociateRouteTable API operation.
      # @method associate_route_table(options = {})
      # @param [Hash] options
      #   * +:subnet_id+ - *required* - (String) The ID of the subnet.
      #   * +:route_table_id+ - *required* - (String) The ID of the route
      #     table.
      # @return [Core::Response]
      define_client_method :associate_route_table, 'AssociateRouteTable'

      # Calls the AttachInternetGateway API operation.
      # @method attach_internet_gateway(options = {})
      # @param [Hash] options
      #   * +:internet_gateway_id+ - *required* - (String) The ID of the
      #     Internet gateway to attach.
      #   * +:vpc_id+ - *required* - (String) The ID of the VPC.
      # @return [Core::Response]
      define_client_method :attach_internet_gateway, 'AttachInternetGateway'

      # Calls the AttachNetworkInterface API operation.
      # @method attach_network_interface(options = {})
      # @param [Hash] options
      #   * +:network_interface_id+ - *required* - (String)
      #   * +:instance_id+ - *required* - (String)
      #   * +:device_index+ - *required* - (Integer)
      # @return [Core::Response]
      define_client_method :attach_network_interface, 'AttachNetworkInterface'

      # Calls the AttachVolume API operation.
      # @method attach_volume(options = {})
      # @param [Hash] options
      #   * +:volume_id+ - *required* - (String) The ID of the Amazon EBS
      #     volume. The volume and instance must be within the same
      #     Availability Zone and the instance must be running.
      #   * +:instance_id+ - *required* - (String) The ID of the instance to
      #     which the volume attaches. The volume and instance must be within
      #     the same Availability Zone and the instance must be running.
      #   * +:device+ - *required* - (String) Specifies how the device is
      #     exposed to the instance (e.g., /dev/sdh).
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #   * +:attach_time+ - (Time)
      #   * +:delete_on_termination+ - (Boolean)
      define_client_method :attach_volume, 'AttachVolume'

      # Calls the AttachVpnGateway API operation.
      # @method attach_vpn_gateway(options = {})
      # @param [Hash] options
      #   * +:vpn_gateway_id+ - *required* - (String) The ID of the VPN gateway
      #     to attach to the VPC.
      #   * +:vpc_id+ - *required* - (String) The ID of the VPC to attach to
      #     the VPN gateway.
      # @return [Core::Response]
      define_client_method :attach_vpn_gateway, 'AttachVpnGateway'

      # Calls the AuthorizeSecurityGroupEgress API operation.
      # @method authorize_security_group_egress(options = {})
      # @param [Hash] options
      #   * +:group_id+ - *required* - (String) ID of the VPC security group to
      #     modify.
      #   * +:source_security_group_name+ - (String) Deprecated.
      #   * +:source_security_group_owner_id+ - (String) Deprecated.
      #   * +:ip_protocol+ - (String) Deprecated.
      #   * +:from_port+ - (Integer) Deprecated.
      #   * +:to_port+ - (Integer) Deprecated.
      #   * +:cidr_ip+ - (String) Deprecated.
      #   * +:ip_permissions+ - (Array<Hash>) List of IP permissions to
      #     authorize on the specified security group. Specifying permissions
      #     through IP permissions is the preferred way of authorizing
      #     permissions since it offers more flexibility and control.
      #     * +:ip_protocol+ - (String) The IP protocol of this permission.
      #       Valid protocol values: tcp, udp, icmp
      #     * +:from_port+ - (Integer) Start of port range for the TCP and UDP
      #       protocols, or an ICMP type number. An ICMP type number of -1
      #       indicates a wildcard (i.e., any ICMP type number).
      #     * +:to_port+ - (Integer) End of port range for the TCP and UDP
      #       protocols, or an ICMP code. An ICMP code of -1 indicates a
      #       wildcard (i.e., any ICMP code).
      #     * +:user_id_group_pairs+ - (Array<Hash>) The list of AWS user IDs
      #       and groups included in this permission.
      #       * +:user_id+ - (String) The AWS user ID of an account.
      #       * +:group_name+ - (String) Name of the security group in the
      #         specified AWS account. Cannot be used when specifying a CIDR IP
      #         address range.
      #       * +:group_id+ - (String) ID of the security group in the
      #         specified AWS account. Cannot be used when specifying a CIDR IP
      #         address range.
      #     * +:ip_ranges+ - (Array<Hash>) The list of CIDR IP ranges included
      #       in this permission.
      #       * +:cidr_ip+ - (String) The list of CIDR IP ranges.
      # @return [Core::Response]
      define_client_method :authorize_security_group_egress, 'AuthorizeSecurityGroupEgress'

      # Calls the AuthorizeSecurityGroupIngress API operation.
      # @method authorize_security_group_ingress(options = {})
      # @param [Hash] options
      #   * +:group_name+ - (String) Name of the standard (EC2) security group
      #     to modify. The group must belong to your account. Can be used
      #     instead of GroupID for standard (EC2) security groups.
      #   * +:group_id+ - (String) ID of the standard (EC2) or VPC security
      #     group to modify. The group must belong to your account. Required
      #     for VPC security groups; can be used instead of GroupName for
      #     standard (EC2) security groups.
      #   * +:source_security_group_name+ - (String) Deprecated
      #   * +:source_security_group_owner_id+ - (String) Deprecated
      #   * +:ip_protocol+ - (String) Deprecated
      #   * +:from_port+ - (Integer) Deprecated
      #   * +:to_port+ - (Integer) Deprecated
      #   * +:cidr_ip+ - (String) Deprecated
      #   * +:ip_permissions+ - (Array<Hash>) List of IP permissions to
      #     authorize on the specified security group. Specifying permissions
      #     through IP permissions is the preferred way of authorizing
      #     permissions since it offers more flexibility and control.
      #     * +:ip_protocol+ - (String) The IP protocol of this permission.
      #       Valid protocol values: tcp, udp, icmp
      #     * +:from_port+ - (Integer) Start of port range for the TCP and UDP
      #       protocols, or an ICMP type number. An ICMP type number of -1
      #       indicates a wildcard (i.e., any ICMP type number).
      #     * +:to_port+ - (Integer) End of port range for the TCP and UDP
      #       protocols, or an ICMP code. An ICMP code of -1 indicates a
      #       wildcard (i.e., any ICMP code).
      #     * +:user_id_group_pairs+ - (Array<Hash>) The list of AWS user IDs
      #       and groups included in this permission.
      #       * +:user_id+ - (String) The AWS user ID of an account.
      #       * +:group_name+ - (String) Name of the security group in the
      #         specified AWS account. Cannot be used when specifying a CIDR IP
      #         address range.
      #       * +:group_id+ - (String) ID of the security group in the
      #         specified AWS account. Cannot be used when specifying a CIDR IP
      #         address range.
      #     * +:ip_ranges+ - (Array<Hash>) The list of CIDR IP ranges included
      #       in this permission.
      #       * +:cidr_ip+ - (String) The list of CIDR IP ranges.
      # @return [Core::Response]
      define_client_method :authorize_security_group_ingress, 'AuthorizeSecurityGroupIngress'

      # Calls the BundleInstance API operation.
      # @method bundle_instance(options = {})
      # @param [Hash] options
      #   * +:instance_id+ - *required* - (String) The ID of the instance to
      #     bundle.
      #   * +:storage+ - *required* - (Hash)
      #     * +:s3+ - (Hash) The details of S3 storage for bundling a Windows
      #       instance.
      #       * +:bucket+ - (String) The bucket in which to store the AMI. You
      #         can specify a bucket that you already own or a new bucket that
      #         Amazon EC2 creates on your behalf. If you specify a bucket that
      #         belongs to someone else, Amazon EC2 returns an error.
      #       * +:prefix+ - (String) The prefix to use when storing the AMI in
      #         S3.
      #       * +:aws_access_key_id+ - (String) The Access Key ID of the owner
      #         of the Amazon S3 bucket.
      #       * +:upload_policy+ - (String) A Base64-encoded Amazon S3 upload
      #         policy that gives Amazon EC2 permission to upload items into
      #         Amazon S3 on the user's behalf.
      #       * +:upload_policy_signature+ - (String) The signature of the
      #         Base64 encoded JSON document.
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #   * +:bundle_instance_task+ - (Hash)
      #     * +:start_time+ - (Time)
      #     * +:update_time+ - (Time)
      define_client_method :bundle_instance, 'BundleInstance'

      # Calls the CancelBundleTask API operation.
      # @method cancel_bundle_task(options = {})
      # @param [Hash] options
      #   * +:bundle_id+ - *required* - (String) The ID of the bundle task to
      #     cancel.
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #   * +:bundle_instance_task+ - (Hash)
      #     * +:start_time+ - (Time)
      #     * +:update_time+ - (Time)
      define_client_method :cancel_bundle_task, 'CancelBundleTask'

      # Calls the CancelConversionTask API operation.
      # @method cancel_conversion_task(options = {})
      # @param [Hash] options
      #   * +:conversion_task_id+ - *required* - (String)
      #   * +:reason_message+ - (String)
      # @return [Core::Response]
      define_client_method :cancel_conversion_task, 'CancelConversionTask'

      # Calls the CancelExportTask API operation.
      # @method cancel_export_task(options = {})
      # @param [Hash] options
      #   * +:export_task_id+ - *required* - (String)
      # @return [Core::Response]
      define_client_method :cancel_export_task, 'CancelExportTask'

      # Calls the CancelSpotInstanceRequests API operation.
      # @method cancel_spot_instance_requests(options = {})
      # @param [Hash] options
      #   * +:spot_instance_request_ids+ - *required* - (Array<String>)
      #     Specifies the ID of the Spot Instance request.
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #   * +:spot_instance_request_set+ - (Array<>)
      define_client_method :cancel_spot_instance_requests, 'CancelSpotInstanceRequests'

      # Calls the ConfirmProductInstance API operation.
      # @method confirm_product_instance(options = {})
      # @param [Hash] options
      #   * +:product_code+ - *required* - (String) The product code to
      #     confirm.
      #   * +:instance_id+ - *required* - (String) The ID of the instance to
      #     confirm.
      # @return [Core::Response]
      define_client_method :confirm_product_instance, 'ConfirmProductInstance'

      # Calls the CreateCustomerGateway API operation.
      # @method create_customer_gateway(options = {})
      # @param [Hash] options
      #   * +:type+ - *required* - (String) The type of VPN connection this
      #     customer gateway supports.
      #   * +:public_ip+ - *required* - (String) The Internet-routable IP
      #     address for the customer gateway's outside interface. The address
      #     must be static
      #   * +:bgp_asn+ - *required* - (Integer) The customer gateway's Border
      #     Gateway Protocol (BGP) Autonomous System Number (ASN).
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #   * +:customer_gateway+ - (Hash)
      #     * +:tag_set+ - (Array<>)
      define_client_method :create_customer_gateway, 'CreateCustomerGateway'

      # Calls the CreateDhcpOptions API operation.
      # @method create_dhcp_options(options = {})
      # @param [Hash] options
      #   * +:dhcp_configurations+ - *required* - (Array<Hash>) A set of one or
      #     more DHCP configurations.
      #     * +:key+ - (String) Contains the name of a DHCP option.
      #     * +:values+ - (Array<String>) Contains a set of values for a DHCP
      #       option.
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #   * +:dhcp_options+ - (Hash)
      #     * +:dhcp_configuration_set+ - (Array<Hash>)
      #       * +:value_set+ - (Array<>)
      #     * +:tag_set+ - (Array<>)
      define_client_method :create_dhcp_options, 'CreateDhcpOptions'

      # Calls the CreateImage API operation.
      # @method create_image(options = {})
      # @param [Hash] options
      #   * +:instance_id+ - *required* - (String) The ID of the instance from
      #     which to create the new image.
      #   * +:name+ - *required* - (String) The name for the new AMI being
      #     created.
      #   * +:description+ - (String) The description for the new AMI being
      #     created.
      #   * +:no_reboot+ - (Boolean) By default this property is set to +false+
      #     , which means Amazon EC2 attempts to cleanly shut down the instance
      #     before image creation and reboots the instance afterwards. When set
      #     to +true+ , Amazon EC2 will not shut down the instance before
      #     creating the image. When this option is used, file system integrity
      #     on the created image cannot be guaranteed.
      #   * +:block_device_mappings+ - (Array<Hash>)
      #     * +:virtual_name+ - (String) Specifies the virtual device name.
      #     * +:device_name+ - (String) Specifies the device name (e.g.,
      #       /dev/sdh).
      #     * +:ebs+ - (Hash) Specifies parameters used to automatically setup
      #       Amazon EBS volumes when the instance is launched.
      #       * +:snapshot_id+ - (String) The ID of the snapshot from which the
      #         volume will be created.
      #       * +:volume_size+ - (Integer) The size of the volume, in
      #         gigabytes.
      #       * +:delete_on_termination+ - (Boolean) Specifies whether the
      #         Amazon EBS volume is deleted on instance termination.
      #       * +:volume_type+ - (String)
      #       * +:iops+ - (Integer)
      #     * +:no_device+ - (String) Specifies the device name to suppress
      #       during instance launch.
      # @return [Core::Response]
      define_client_method :create_image, 'CreateImage'

      # Calls the CreateInstanceExportTask API operation.
      # @method create_instance_export_task(options = {})
      # @param [Hash] options
      #   * +:description+ - (String)
      #   * +:instance_id+ - *required* - (String)
      #   * +:target_environment+ - (String)
      #   * +:export_to_s3_task+ - (Hash)
      #     * +:disk_image_format+ - (String)
      #     * +:container_format+ - (String)
      #     * +:s3_bucket+ - (String)
      #     * +:s3_prefix+ - (String)
      # @return [Core::Response]
      define_client_method :create_instance_export_task, 'CreateInstanceExportTask'

      # Calls the CreateInternetGateway API operation.
      # @method create_internet_gateway(options = {})
      # @param [Hash] options
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #   * +:internet_gateway+ - (Hash)
      #     * +:attachment_set+ - (Array<>)
      #     * +:tag_set+ - (Array<>)
      define_client_method :create_internet_gateway, 'CreateInternetGateway'

      # Calls the CreateKeyPair API operation.
      # @method create_key_pair(options = {})
      # @param [Hash] options
      #   * +:key_name+ - *required* - (String) The unique name for the new key
      #     pair.
      # @return [Core::Response]
      define_client_method :create_key_pair, 'CreateKeyPair'

      # Calls the CreateNetworkAcl API operation.
      # @method create_network_acl(options = {})
      # @param [Hash] options
      #   * +:vpc_id+ - *required* - (String) The ID of the VPC where the
      #     network ACL will be created.
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #   * +:network_acl+ - (Hash)
      #     * +:default+ - (Boolean)
      #     * +:entry_set+ - (Array<Hash>)
      #       * +:rule_number+ - (Integer)
      #       * +:egress+ - (Boolean)
      #       * +:icmp_type_code+ - (Hash)
      #         * +:type+ - (Integer)
      #         * +:code+ - (Integer)
      #       * +:port_range+ - (Hash)
      #         * +:from+ - (Integer)
      #         * +:to+ - (Integer)
      #     * +:association_set+ - (Array<>)
      #     * +:tag_set+ - (Array<>)
      define_client_method :create_network_acl, 'CreateNetworkAcl'

      # Calls the CreateNetworkAclEntry API operation.
      # @method create_network_acl_entry(options = {})
      # @param [Hash] options
      #   * +:network_acl_id+ - *required* - (String) ID of the ACL where the
      #     entry will be created.
      #   * +:rule_number+ - *required* - (Integer) Rule number to assign to
      #     the entry (e.g., 100). ACL entries are processed in ascending order
      #     by rule number.
      #   * +:protocol+ - *required* - (String) IP protocol the rule applies
      #     to. Valid Values: tcp, udp, icmp or an IP protocol number.
      #   * +:rule_action+ - *required* - (String) Whether to allow or deny
      #     traffic that matches the rule.
      #   * +:egress+ - *required* - (Boolean) Whether this rule applies to
      #     egress traffic from the subnet ( +true+ ) or ingress traffic to the
      #     subnet ( +false+ ).
      #   * +:cidr_block+ - *required* - (String) The CIDR range to allow or
      #     deny, in CIDR notation (e.g., 172.16.0.0/24).
      #   * +:icmp_type_code+ - (Hash) ICMP values.
      #     * +:type+ - (Integer) For the ICMP protocol, the ICMP type. A value
      #       of -1 is a wildcard meaning all types. Required if specifying
      #       icmp for the protocol.
      #     * +:code+ - (Integer) For the ICMP protocol, the ICMP code. A value
      #       of -1 is a wildcard meaning all codes. Required if specifying
      #       icmp for the protocol.
      #   * +:port_range+ - (Hash) Port ranges.
      #     * +:from+ - (Integer) The first port in the range. Required if
      #       specifying tcp or udp for the protocol.
      #     * +:to+ - (Integer) The last port in the range. Required if
      #       specifying tcp or udp for the protocol.
      # @return [Core::Response]
      define_client_method :create_network_acl_entry, 'CreateNetworkAclEntry'

      # Calls the CreateNetworkInterface API operation.
      # @method create_network_interface(options = {})
      # @param [Hash] options
      #   * +:subnet_id+ - *required* - (String)
      #   * +:description+ - (String)
      #   * +:private_ip_address+ - (String)
      #   * +:groups+ - (Array<String>)
      #   * +:private_ip_addresses+ - (Array<Hash>)
      #     * +:private_ip_address+ - *required* - (String)
      #     * +:primary+ - (Boolean)
      #   * +:secondary_private_ip_address_count+ - (Integer)
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #   * +:network_interface+ - (Hash)
      #     * +:requester_managed+ - (Boolean)
      #     * +:source_dest_check+ - (Boolean)
      #     * +:group_set+ - (Array<>)
      #     * +:attachment+ - (Hash)
      #       * +:device_index+ - (Integer)
      #       * +:attach_time+ - (Time)
      #       * +:delete_on_termination+ - (Boolean)
      #     * +:tag_set+ - (Array<>)
      #     * +:private_ip_addresses_set+ - (Array<Hash>)
      #       * +:primary+ - (Boolean)
      define_client_method :create_network_interface, 'CreateNetworkInterface'

      # Calls the CreatePlacementGroup API operation.
      # @method create_placement_group(options = {})
      # @param [Hash] options
      #   * +:group_name+ - *required* - (String) The name of the
      #     PlacementGroup.
      #   * +:strategy+ - *required* - (String) The PlacementGroup strategy.
      # @return [Core::Response]
      define_client_method :create_placement_group, 'CreatePlacementGroup'

      # Calls the CreateRoute API operation.
      # @method create_route(options = {})
      # @param [Hash] options
      #   * +:route_table_id+ - *required* - (String) The ID of the route table
      #     where the route will be added.
      #   * +:destination_cidr_block+ - *required* - (String) The CIDR address
      #     block used for the destination match. For example: 0.0.0.0/0.
      #     Routing decisions are based on the most specific match.
      #   * +:gateway_id+ - (String) The ID of a VPN or Internet gateway
      #     attached to your VPC. You must provide either GatewayId or
      #     InstanceId, but not both.
      #   * +:instance_id+ - (String) The ID of a NAT instance in your VPC. You
      #     must provide either GatewayId or InstanceId, but not both.
      #   * +:network_interface_id+ - (String)
      # @return [Core::Response]
      define_client_method :create_route, 'CreateRoute'

      # Calls the CreateRouteTable API operation.
      # @method create_route_table(options = {})
      # @param [Hash] options
      #   * +:vpc_id+ - *required* - (String) The ID of the VPC where the route
      #     table will be created.
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #   * +:route_table+ - (Hash)
      #     * +:route_set+ - (Array<>)
      #     * +:association_set+ - (Array<Hash>)
      #       * +:main+ - (Boolean)
      #     * +:tag_set+ - (Array<>)
      define_client_method :create_route_table, 'CreateRouteTable'

      # Calls the CreateSecurityGroup API operation.
      # @method create_security_group(options = {})
      # @param [Hash] options
      #   * +:group_name+ - *required* - (String) Name of the security group.
      #   * +:description+ - *required* - (String) Description of the group.
      #     This is informational only.
      #   * +:vpc_id+ - (String) ID of the VPC.
      # @return [Core::Response]
      define_client_method :create_security_group, 'CreateSecurityGroup'

      # Calls the CreateSnapshot API operation.
      # @method create_snapshot(options = {})
      # @param [Hash] options
      #   * +:volume_id+ - *required* - (String) The ID of the volume from
      #     which to create the snapshot.
      #   * +:description+ - (String) The description for the new snapshot.
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #   * +:start_time+ - (Time)
      #   * +:volume_size+ - (Integer)
      #   * +:tag_set+ - (Array<>)
      define_client_method :create_snapshot, 'CreateSnapshot'

      # Calls the CreateSpotDatafeedSubscription API operation.
      # @method create_spot_datafeed_subscription(options = {})
      # @param [Hash] options
      #   * +:bucket+ - *required* - (String) The Amazon S3 bucket in which to
      #     store the Spot Instance datafeed.
      #   * +:prefix+ - (String) The prefix that is prepended to datafeed
      #     files.
      # @return [Core::Response]
      define_client_method :create_spot_datafeed_subscription, 'CreateSpotDatafeedSubscription'

      # Calls the CreateSubnet API operation.
      # @method create_subnet(options = {})
      # @param [Hash] options
      #   * +:vpc_id+ - *required* - (String) The ID of the VPC to create the
      #     subnet in.
      #   * +:cidr_block+ - *required* - (String) The CIDR block the subnet is
      #     to cover.
      #   * +:availability_zone+ - (String) The Availability Zone to create the
      #     subnet in.
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #   * +:subnet+ - (Hash)
      #     * +:available_ip_address_count+ - (Integer)
      #     * +:tag_set+ - (Array<>)
      define_client_method :create_subnet, 'CreateSubnet'

      # Calls the CreateTags API operation.
      # @method create_tags(options = {})
      # @param [Hash] options
      #   * +:resources+ - *required* - (Array<String>) One or more IDs of
      #     resources to tag. This could be the ID of an AMI, an instance, an
      #     EBS volume, or snapshot, etc.
      #   * +:tags+ - *required* - (Array<Hash>) The tags to add or overwrite
      #     for the specified resources. Each tag item consists of a key-value
      #     pair.
      #     * +:key+ - (String) The tag's key.
      #     * +:value+ - (String) The tag's value.
      # @return [Core::Response]
      define_client_method :create_tags, 'CreateTags'

      # Calls the CreateVolume API operation.
      # @method create_volume(options = {})
      # @param [Hash] options
      #   * +:size+ - (Integer) The size of the volume, in gigabytes. Required
      #     if you are not creating a volume from a snapshot.
      #   * +:snapshot_id+ - (String) The ID of the snapshot from which to
      #     create the new volume.
      #   * +:availability_zone+ - *required* - (String) The Availability Zone
      #     in which to create the new volume.
      #   * +:volume_type+ - (String)
      #   * +:iops+ - (Integer)
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #   * +:size+ - (Integer)
      #   * +:create_time+ - (Time)
      #   * +:attachment_set+ - (Array<Hash>)
      #     * +:attach_time+ - (Time)
      #     * +:delete_on_termination+ - (Boolean)
      #   * +:tag_set+ - (Array<>)
      #   * +:iops+ - (Integer)
      define_client_method :create_volume, 'CreateVolume'

      # Calls the CreateVpc API operation.
      # @method create_vpc(options = {})
      # @param [Hash] options
      #   * +:cidr_block+ - *required* - (String) A valid CIDR block.
      #   * +:instance_tenancy+ - (String) The allowed tenancy of instances
      #     launched into the VPC. A value of default means instances can be
      #     launched with any tenancy; a value of dedicated means instances
      #     must be launched with tenancy as dedicated.
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #   * +:vpc+ - (Hash)
      #     * +:tag_set+ - (Array<>)
      define_client_method :create_vpc, 'CreateVpc'

      # Calls the CreateVpnConnection API operation.
      # @method create_vpn_connection(options = {})
      # @param [Hash] options
      #   * +:type+ - *required* - (String) The type of VPN connection.
      #   * +:customer_gateway_id+ - *required* - (String) The ID of the
      #     customer gateway.
      #   * +:vpn_gateway_id+ - *required* - (String) The ID of the VPN
      #     gateway.
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #   * +:vpn_connection+ - (Hash)
      #     * +:tag_set+ - (Array<>)
      #     * +:vgw_telemetry+ - (Array<Hash>)
      #       * +:last_status_change+ - (Time)
      #       * +:accepted_route_count+ - (Integer)
      define_client_method :create_vpn_connection, 'CreateVpnConnection'

      # Calls the CreateVpnGateway API operation.
      # @method create_vpn_gateway(options = {})
      # @param [Hash] options
      #   * +:type+ - *required* - (String) The type of VPN connection this VPN
      #     gateway supports.
      #   * +:availability_zone+ - (String) The Availability Zone in which to
      #     create the VPN gateway.
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #   * +:vpn_gateway+ - (Hash)
      #     * +:attachments+ - (Array<>)
      #     * +:tag_set+ - (Array<>)
      #     * +:vpn_type+ - (String)
      define_client_method :create_vpn_gateway, 'CreateVpnGateway'

      # Calls the DeactivateLicense API operation.
      # @method deactivate_license(options = {})
      # @param [Hash] options
      #   * +:license_id+ - *required* - (String) Specifies the ID for the
      #     specific license to deactivate against.
      #   * +:capacity+ - *required* - (Integer) Specifies the amount of
      #     capacity to deactivate against the license.
      # @return [Core::Response]
      define_client_method :deactivate_license, 'DeactivateLicense'

      # Calls the DeleteCustomerGateway API operation.
      # @method delete_customer_gateway(options = {})
      # @param [Hash] options
      #   * +:customer_gateway_id+ - *required* - (String) The ID of the
      #     customer gateway to delete.
      # @return [Core::Response]
      define_client_method :delete_customer_gateway, 'DeleteCustomerGateway'

      # Calls the DeleteDhcpOptions API operation.
      # @method delete_dhcp_options(options = {})
      # @param [Hash] options
      #   * +:dhcp_options_id+ - *required* - (String) The ID of the DHCP
      #     options set to delete.
      # @return [Core::Response]
      define_client_method :delete_dhcp_options, 'DeleteDhcpOptions'

      # Calls the DeleteInternetGateway API operation.
      # @method delete_internet_gateway(options = {})
      # @param [Hash] options
      #   * +:internet_gateway_id+ - *required* - (String) The ID of the
      #     Internet gateway to be deleted.
      # @return [Core::Response]
      define_client_method :delete_internet_gateway, 'DeleteInternetGateway'

      # Calls the DeleteKeyPair API operation.
      # @method delete_key_pair(options = {})
      # @param [Hash] options
      #   * +:key_name+ - *required* - (String) The name of the Amazon EC2 key
      #     pair to delete.
      # @return [Core::Response]
      define_client_method :delete_key_pair, 'DeleteKeyPair'

      # Calls the DeleteNetworkAcl API operation.
      # @method delete_network_acl(options = {})
      # @param [Hash] options
      #   * +:network_acl_id+ - *required* - (String) The ID of the network ACL
      #     to be deleted.
      # @return [Core::Response]
      define_client_method :delete_network_acl, 'DeleteNetworkAcl'

      # Calls the DeleteNetworkAclEntry API operation.
      # @method delete_network_acl_entry(options = {})
      # @param [Hash] options
      #   * +:network_acl_id+ - *required* - (String) ID of the network ACL.
      #   * +:rule_number+ - *required* - (Integer) Rule number for the entry
      #     to delete.
      #   * +:egress+ - *required* - (Boolean) Whether the rule to delete is an
      #     egress rule ( +true+ ) or ingress rule ( +false+ ).
      # @return [Core::Response]
      define_client_method :delete_network_acl_entry, 'DeleteNetworkAclEntry'

      # Calls the DeleteNetworkInterface API operation.
      # @method delete_network_interface(options = {})
      # @param [Hash] options
      #   * +:network_interface_id+ - *required* - (String)
      # @return [Core::Response]
      define_client_method :delete_network_interface, 'DeleteNetworkInterface'

      # Calls the DeletePlacementGroup API operation.
      # @method delete_placement_group(options = {})
      # @param [Hash] options
      #   * +:group_name+ - *required* - (String) The name of the
      #     PlacementGroup to delete.
      # @return [Core::Response]
      define_client_method :delete_placement_group, 'DeletePlacementGroup'

      # Calls the DeleteRoute API operation.
      # @method delete_route(options = {})
      # @param [Hash] options
      #   * +:route_table_id+ - *required* - (String) The ID of the route table
      #     where the route will be deleted.
      #   * +:destination_cidr_block+ - *required* - (String) The CIDR range
      #     for the route you want to delete. The value you specify must
      #     exactly match the CIDR for the route you want to delete.
      # @return [Core::Response]
      define_client_method :delete_route, 'DeleteRoute'

      # Calls the DeleteRouteTable API operation.
      # @method delete_route_table(options = {})
      # @param [Hash] options
      #   * +:route_table_id+ - *required* - (String) The ID of the route table
      #     to be deleted.
      # @return [Core::Response]
      define_client_method :delete_route_table, 'DeleteRouteTable'

      # Calls the DeleteSecurityGroup API operation.
      # @method delete_security_group(options = {})
      # @param [Hash] options
      #   * +:group_name+ - (String) The name of the Amazon EC2 security group
      #     to delete.
      #   * +:group_id+ - (String) The ID of the Amazon EC2 security group to
      #     delete.
      # @return [Core::Response]
      define_client_method :delete_security_group, 'DeleteSecurityGroup'

      # Calls the DeleteSnapshot API operation.
      # @method delete_snapshot(options = {})
      # @param [Hash] options
      #   * +:snapshot_id+ - *required* - (String) The ID of the snapshot to
      #     delete.
      # @return [Core::Response]
      define_client_method :delete_snapshot, 'DeleteSnapshot'

      # Calls the DeleteSpotDatafeedSubscription API operation.
      # @method delete_spot_datafeed_subscription(options = {})
      # @param [Hash] options
      # @return [Core::Response]
      define_client_method :delete_spot_datafeed_subscription, 'DeleteSpotDatafeedSubscription'

      # Calls the DeleteSubnet API operation.
      # @method delete_subnet(options = {})
      # @param [Hash] options
      #   * +:subnet_id+ - *required* - (String) The ID of the subnet you want
      #     to delete.
      # @return [Core::Response]
      define_client_method :delete_subnet, 'DeleteSubnet'

      # Calls the DeleteTags API operation.
      # @method delete_tags(options = {})
      # @param [Hash] options
      #   * +:resources+ - *required* - (Array<String>) A list of one or more
      #     resource IDs. This could be the ID of an AMI, an instance, an EBS
      #     volume, or snapshot, etc.
      #   * +:tags+ - (Array<Hash>) The tags to delete from the specified
      #     resources. Each tag item consists of a key-value pair. If a tag is
      #     specified without a value, the tag and all of its values are
      #     deleted.
      #     * +:key+ - (String) The tag's key.
      #     * +:value+ - (String) The tag's value.
      # @return [Core::Response]
      define_client_method :delete_tags, 'DeleteTags'

      # Calls the DeleteVolume API operation.
      # @method delete_volume(options = {})
      # @param [Hash] options
      #   * +:volume_id+ - *required* - (String) The ID of the EBS volume to
      #     delete.
      # @return [Core::Response]
      define_client_method :delete_volume, 'DeleteVolume'

      # Calls the DeleteVpc API operation.
      # @method delete_vpc(options = {})
      # @param [Hash] options
      #   * +:vpc_id+ - *required* - (String) The ID of the VPC you want to
      #     delete.
      # @return [Core::Response]
      define_client_method :delete_vpc, 'DeleteVpc'

      # Calls the DeleteVpnConnection API operation.
      # @method delete_vpn_connection(options = {})
      # @param [Hash] options
      #   * +:vpn_connection_id+ - *required* - (String) The ID of the VPN
      #     connection to delete
      # @return [Core::Response]
      define_client_method :delete_vpn_connection, 'DeleteVpnConnection'

      # Calls the DeleteVpnGateway API operation.
      # @method delete_vpn_gateway(options = {})
      # @param [Hash] options
      #   * +:vpn_gateway_id+ - *required* - (String) The ID of the VPN gateway
      #     to delete.
      # @return [Core::Response]
      define_client_method :delete_vpn_gateway, 'DeleteVpnGateway'

      # Calls the DeregisterImage API operation.
      # @method deregister_image(options = {})
      # @param [Hash] options
      #   * +:image_id+ - *required* - (String) The ID of the AMI to
      #     deregister.
      # @return [Core::Response]
      define_client_method :deregister_image, 'DeregisterImage'

      # Calls the DescribeAddresses API operation.
      # @method describe_addresses(options = {})
      # @param [Hash] options
      #   * +:public_ips+ - (Array<String>) The optional list of Elastic IP
      #     addresses to describe.
      #   * +:filters+ - (Array<Hash>) A list of filters used to match
      #     properties for Addresses. For a complete reference to the available
      #     filter keys for this operation, see the Amazon EC2 API reference.
      #     * +:name+ - (String) Specifies the name of the filter.
      #     * +:values+ - (Array<String>) Contains one or more values for the
      #       filter.
      #   * +:allocation_ids+ - (Array<String>)
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #   * +:addresses_set+ - (Array<>)
      define_client_method :describe_addresses, 'DescribeAddresses'

      # Calls the DescribeAvailabilityZones API operation.
      # @method describe_availability_zones(options = {})
      # @param [Hash] options
      #   * +:zone_names+ - (Array<String>) A list of the availability zone
      #     names to describe.
      #   * +:filters+ - (Array<Hash>) A list of filters used to match
      #     properties for AvailabilityZones. For a complete reference to the
      #     available filter keys for this operation, see the Amazon EC2 API
      #     reference.
      #     * +:name+ - (String) Specifies the name of the filter.
      #     * +:values+ - (Array<String>) Contains one or more values for the
      #       filter.
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #   * +:availability_zone_info+ - (Array<Hash>)
      #     * +:message_set+ - (Array<>)
      define_client_method :describe_availability_zones, 'DescribeAvailabilityZones'

      # Calls the DescribeBundleTasks API operation.
      # @method describe_bundle_tasks(options = {})
      # @param [Hash] options
      #   * +:bundle_ids+ - (Array<String>) The list of bundle task IDs to
      #     describe.
      #   * +:filters+ - (Array<Hash>) A list of filters used to match
      #     properties for BundleTasks. For a complete reference to the
      #     available filter keys for this operation, see the Amazon EC2 API
      #     reference.
      #     * +:name+ - (String) Specifies the name of the filter.
      #     * +:values+ - (Array<String>) Contains one or more values for the
      #       filter.
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #   * +:bundle_instance_tasks_set+ - (Array<Hash>)
      #     * +:start_time+ - (Time)
      #     * +:update_time+ - (Time)
      define_client_method :describe_bundle_tasks, 'DescribeBundleTasks'

      # Calls the DescribeConversionTasks API operation.
      # @method describe_conversion_tasks(options = {})
      # @param [Hash] options
      #   * +:filters+ - (Array<Hash>)
      #     * +:name+ - (String) Specifies the name of the filter.
      #     * +:values+ - (Array<String>) Contains one or more values for the
      #       filter.
      #   * +:conversion_task_ids+ - (Array<String>)
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #   * +:conversion_tasks+ - (Array<Hash>)
      #     * +:import_instance+ - (Hash)
      #       * +:volumes+ - (Array<Hash>)
      #         * +:bytes_converted+ - (Integer)
      #         * +:image+ - (Hash)
      #           * +:size+ - (Integer)
      #         * +:volume+ - (Hash)
      #           * +:size+ - (Integer)
      #     * +:import_volume+ - (Hash)
      #       * +:bytes_converted+ - (Integer)
      #       * +:image+ - (Hash)
      #         * +:size+ - (Integer)
      #       * +:volume+ - (Hash)
      #         * +:size+ - (Integer)
      #     * +:tag_set+ - (Array<>)
      define_client_method :describe_conversion_tasks, 'DescribeConversionTasks'

      # Calls the DescribeCustomerGateways API operation.
      # @method describe_customer_gateways(options = {})
      # @param [Hash] options
      #   * +:customer_gateway_ids+ - (Array<String>) A set of one or more
      #     customer gateway IDs.
      #   * +:filters+ - (Array<Hash>) A list of filters used to match
      #     properties for Customer Gateways. For a complete reference to the
      #     available filter keys for this operation, see the Amazon EC2 API
      #     reference.
      #     * +:name+ - (String) Specifies the name of the filter.
      #     * +:values+ - (Array<String>) Contains one or more values for the
      #       filter.
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #   * +:customer_gateway_set+ - (Array<Hash>)
      #     * +:tag_set+ - (Array<>)
      #     * +:vpn_type+ - (String)
      define_client_method :describe_customer_gateways, 'DescribeCustomerGateways'

      # Calls the DescribeDhcpOptions API operation.
      # @method describe_dhcp_options(options = {})
      # @param [Hash] options
      #   * +:dhcp_options_ids+ - (Array<String>)
      #   * +:filters+ - (Array<Hash>) A list of filters used to match
      #     properties for DhcpOptions. For a complete reference to the
      #     available filter keys for this operation, see the Amazon EC2 API
      #     reference.
      #     * +:name+ - (String) Specifies the name of the filter.
      #     * +:values+ - (Array<String>) Contains one or more values for the
      #       filter.
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #   * +:dhcp_options_set+ - (Array<Hash>)
      #     * +:dhcp_configuration_set+ - (Array<Hash>)
      #       * +:value_set+ - (Array<>)
      #     * +:tag_set+ - (Array<>)
      define_client_method :describe_dhcp_options, 'DescribeDhcpOptions'

      # Calls the DescribeExportTasks API operation.
      # @method describe_export_tasks(options = {})
      # @param [Hash] options
      #   * +:export_task_ids+ - (Array<String>)
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #   * +:export_task_set+ - (Array<>)
      define_client_method :describe_export_tasks, 'DescribeExportTasks'

      # Calls the DescribeImageAttribute API operation.
      # @method describe_image_attribute(options = {})
      # @param [Hash] options
      #   * +:image_id+ - *required* - (String) The ID of the AMI whose
      #     attribute is to be described.
      #   * +:attribute+ - *required* - (String) The name of the attribute to
      #     describe. Available attribute names: productCodes, kernel, ramdisk,
      #     launchPermisson, blockDeviceMapping
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #   * +:launch_permission+ - (Array<>)
      #   * +:product_codes+ - (Array<>)
      #   * +:block_device_mapping+ - (Array<Hash>)
      #     * +:ebs+ - (Hash)
      #       * +:volume_size+ - (Integer)
      #       * +:delete_on_termination+ - (Boolean)
      #       * +:iops+ - (Integer)
      define_client_method :describe_image_attribute, 'DescribeImageAttribute'

      # Calls the DescribeImages API operation.
      # @method describe_images(options = {})
      # @param [Hash] options
      #   * +:image_ids+ - (Array<String>) An optional list of the AMI IDs to
      #     describe. If not specified, all AMIs will be described.
      #   * +:owners+ - (Array<String>) The optional list of owners for the
      #     described AMIs. The IDs amazon, self, and explicit can be used to
      #     include AMIs owned by Amazon, AMIs owned by the user, and AMIs for
      #     which the user has explicit launch permissions, respectively.
      #   * +:executable_users+ - (Array<String>) The optional list of users
      #     with explicit launch permissions for the described AMIs. The user
      #     ID can be a user's account ID, 'self' to return AMIs for which the
      #     sender of the request has explicit launch permissions, or 'all' to
      #     return AMIs with public launch permissions.
      #   * +:filters+ - (Array<Hash>) A list of filters used to match
      #     properties for Images. For a complete reference to the available
      #     filter keys for this operation, see the Amazon EC2 API reference.
      #     * +:name+ - (String) Specifies the name of the filter.
      #     * +:values+ - (Array<String>) Contains one or more values for the
      #       filter.
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #   * +:images_set+ - (Array<Hash>)
      #     * +:is_public+ - (Boolean)
      #     * +:product_codes+ - (Array<>)
      #     * +:block_device_mapping+ - (Array<Hash>)
      #       * +:ebs+ - (Hash)
      #         * +:volume_size+ - (Integer)
      #         * +:delete_on_termination+ - (Boolean)
      #         * +:iops+ - (Integer)
      #     * +:tag_set+ - (Array<>)
      define_client_method :describe_images, 'DescribeImages'

      # Calls the DescribeInstanceAttribute API operation.
      # @method describe_instance_attribute(options = {})
      # @param [Hash] options
      #   * +:instance_id+ - *required* - (String) The ID of the instance whose
      #     instance attribute is being described.
      #   * +:attribute+ - *required* - (String) The name of the attribute to
      #     describe. Available attribute names: instanceType, kernel, ramdisk,
      #     userData, disableApiTermination, instanceInitiatedShutdownBehavior,
      #     rootDeviceName, blockDeviceMapping
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #   * +:disable_api_termination+ - (Hash)
      #     * +:value+ - (Boolean)
      #   * +:block_device_mapping+ - (Array<Hash>)
      #     * +:ebs+ - (Hash)
      #       * +:attach_time+ - (Time)
      #       * +:delete_on_termination+ - (Boolean)
      #   * +:product_codes+ - (Array<>)
      #   * +:ebs_optimized+ - (Hash)
      #     * +:value+ - (Boolean)
      define_client_method :describe_instance_attribute, 'DescribeInstanceAttribute'

      # Calls the DescribeInstanceStatus API operation.
      # @method describe_instance_status(options = {})
      # @param [Hash] options
      #   * +:instance_ids+ - (Array<String>) The list of instance IDs. If not
      #     specified, all instances are described.
      #   * +:filters+ - (Array<Hash>) The list of filters to limit returned
      #     results.
      #     * +:name+ - (String) Specifies the name of the filter.
      #     * +:values+ - (Array<String>) Contains one or more values for the
      #       filter.
      #   * +:next_token+ - (String) A string specifying the next paginated set
      #     of results to return.
      #   * +:max_results+ - (Integer) The maximum number of paginated instance
      #     items per response.
      #   * +:include_all_instances+ - (Boolean)
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #   * +:instance_status_set+ - (Array<Hash>)
      #     * +:events_set+ - (Array<Hash>)
      #       * +:not_before+ - (Time)
      #       * +:not_after+ - (Time)
      #     * +:instance_state+ - (Hash)
      #       * +:code+ - (Integer)
      #     * +:system_status+ - (Hash)
      #       * +:details+ - (Array<Hash>)
      #         * +:impaired_since+ - (Time)
      #     * +:instance_status+ - (Hash)
      #       * +:details+ - (Array<Hash>)
      #         * +:impaired_since+ - (Time)
      define_client_method :describe_instance_status, 'DescribeInstanceStatus'

      # Calls the DescribeInstances API operation.
      # @method describe_instances(options = {})
      # @param [Hash] options
      #   * +:instance_ids+ - (Array<String>) An optional list of the instances
      #     to describe.
      #   * +:filters+ - (Array<Hash>) A list of filters used to match
      #     properties for Instances. For a complete reference to the available
      #     filter keys for this operation, see the Amazon EC2 API reference.
      #     * +:name+ - (String) Specifies the name of the filter.
      #     * +:values+ - (Array<String>) Contains one or more values for the
      #       filter.
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #   * +:reservation_set+ - (Array<Hash>)
      #     * +:group_set+ - (Array<>)
      #     * +:instances_set+ - (Array<Hash>)
      #       * +:instance_state+ - (Hash)
      #         * +:code+ - (Integer)
      #       * +:ami_launch_index+ - (Integer)
      #       * +:product_codes+ - (Array<>)
      #       * +:launch_time+ - (Time)
      #       * +:block_device_mapping+ - (Array<Hash>)
      #         * +:ebs+ - (Hash)
      #           * +:attach_time+ - (Time)
      #           * +:delete_on_termination+ - (Boolean)
      #       * +:tag_set+ - (Array<>)
      #       * +:group_set+ - (Array<>)
      #       * +:source_dest_check+ - (Boolean)
      #       * +:network_interface_set+ - (Array<Hash>)
      #         * +:source_dest_check+ - (Boolean)
      #         * +:group_set+ - (Array<>)
      #         * +:attachment+ - (Hash)
      #           * +:device_index+ - (Integer)
      #           * +:attach_time+ - (Time)
      #           * +:delete_on_termination+ - (Boolean)
      #       * +:ebs_optimized+ - (Boolean)
      define_client_method :describe_instances, 'DescribeInstances'

      # Calls the DescribeInternetGateways API operation.
      # @method describe_internet_gateways(options = {})
      # @param [Hash] options
      #   * +:internet_gateway_ids+ - (Array<String>) One or more Internet
      #     gateway IDs.
      #   * +:filters+ - (Array<Hash>) A list of filters used to match
      #     properties for Internet Gateways. For a complete reference to the
      #     available filter keys for this operation, see the Amazon EC2 API
      #     reference.
      #     * +:name+ - (String) Specifies the name of the filter.
      #     * +:values+ - (Array<String>) Contains one or more values for the
      #       filter.
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #   * +:internet_gateway_set+ - (Array<Hash>)
      #     * +:attachment_set+ - (Array<>)
      #     * +:tag_set+ - (Array<>)
      define_client_method :describe_internet_gateways, 'DescribeInternetGateways'

      # Calls the DescribeKeyPairs API operation.
      # @method describe_key_pairs(options = {})
      # @param [Hash] options
      #   * +:key_names+ - (Array<String>) The optional list of key pair names
      #     to describe.
      #   * +:filters+ - (Array<Hash>) A list of filters used to match
      #     properties for KeyPairs. For a complete reference to the available
      #     filter keys for this operation, see the Amazon EC2 API reference.
      #     * +:name+ - (String) Specifies the name of the filter.
      #     * +:values+ - (Array<String>) Contains one or more values for the
      #       filter.
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #   * +:key_set+ - (Array<>)
      define_client_method :describe_key_pairs, 'DescribeKeyPairs'

      # Calls the DescribeLicenses API operation.
      # @method describe_licenses(options = {})
      # @param [Hash] options
      #   * +:license_ids+ - (Array<String>) Specifies the license registration
      #     for which details are to be returned.
      #   * +:filters+ - (Array<Hash>) A list of filters used to match
      #     properties for Licenses. For a complete reference to the available
      #     filter keys for this operation, see the Amazon EC2 API reference.
      #     * +:name+ - (String) Specifies the name of the filter.
      #     * +:values+ - (Array<String>) Contains one or more values for the
      #       filter.
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #   * +:license_set+ - (Array<Hash>)
      #     * +:capacity_set+ - (Array<Hash>)
      #       * +:capacity+ - (Integer)
      #       * +:instance_capacity+ - (Integer)
      #       * +:earliest_allowed_deactivation_time+ - (Time)
      #     * +:tag_set+ - (Array<>)
      define_client_method :describe_licenses, 'DescribeLicenses'

      # Calls the DescribeNetworkAcls API operation.
      # @method describe_network_acls(options = {})
      # @param [Hash] options
      #   * +:network_acl_ids+ - (Array<String>) One or more network ACL IDs.
      #   * +:filters+ - (Array<Hash>) A list of filters used to match
      #     properties for Network ACLs. For a complete reference to the
      #     available filter keys for this operation, see the Amazon EC2 API
      #     reference.
      #     * +:name+ - (String) Specifies the name of the filter.
      #     * +:values+ - (Array<String>) Contains one or more values for the
      #       filter.
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #   * +:network_acl_set+ - (Array<Hash>)
      #     * +:default+ - (Boolean)
      #     * +:entry_set+ - (Array<Hash>)
      #       * +:rule_number+ - (Integer)
      #       * +:egress+ - (Boolean)
      #       * +:icmp_type_code+ - (Hash)
      #         * +:type+ - (Integer)
      #         * +:code+ - (Integer)
      #       * +:port_range+ - (Hash)
      #         * +:from+ - (Integer)
      #         * +:to+ - (Integer)
      #     * +:association_set+ - (Array<>)
      #     * +:tag_set+ - (Array<>)
      define_client_method :describe_network_acls, 'DescribeNetworkAcls'

      # Calls the DescribeNetworkInterfaceAttribute API operation.
      # @method describe_network_interface_attribute(options = {})
      # @param [Hash] options
      #   * +:network_interface_id+ - *required* - (String)
      #   * +:description+ - (String)
      #   * +:source_dest_check+ - (String)
      #   * +:groups+ - (String)
      #   * +:attachment+ - (String)
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #   * +:source_dest_check+ - (Hash)
      #     * +:value+ - (Boolean)
      #   * +:group_set+ - (Array<>)
      #   * +:attachment+ - (Hash)
      #     * +:device_index+ - (Integer)
      #     * +:attach_time+ - (Time)
      #     * +:delete_on_termination+ - (Boolean)
      define_client_method :describe_network_interface_attribute, 'DescribeNetworkInterfaceAttribute'

      # Calls the DescribeNetworkInterfaces API operation.
      # @method describe_network_interfaces(options = {})
      # @param [Hash] options
      #   * +:network_interface_ids+ - (Array<String>)
      #   * +:filters+ - (Array<Hash>)
      #     * +:name+ - (String) Specifies the name of the filter.
      #     * +:values+ - (Array<String>) Contains one or more values for the
      #       filter.
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #   * +:network_interface_set+ - (Array<Hash>)
      #     * +:requester_managed+ - (Boolean)
      #     * +:source_dest_check+ - (Boolean)
      #     * +:groups+ - (Array<>)
      #     * +:attachment+ - (Hash)
      #       * +:device_index+ - (Integer)
      #       * +:attach_time+ - (Time)
      #       * +:delete_on_termination+ - (Boolean)
      #     * +:tag_set+ - (Array<>)
      #     * +:private_ip_addresses_set+ - (Array<Hash>)
      #       * +:primary+ - (Boolean)
      define_client_method :describe_network_interfaces, 'DescribeNetworkInterfaces'

      # Calls the DescribePlacementGroups API operation.
      # @method describe_placement_groups(options = {})
      # @param [Hash] options
      #   * +:group_names+ - (Array<String>) The name of the PlacementGroup.
      #   * +:filters+ - (Array<Hash>) A list of filters used to match
      #     properties for Placement Groups. For a complete reference to the
      #     available filter keys for this operation, see the Amazon EC2 API
      #     reference.
      #     * +:name+ - (String) Specifies the name of the filter.
      #     * +:values+ - (Array<String>) Contains one or more values for the
      #       filter.
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #   * +:placement_group_set+ - (Array<>)
      define_client_method :describe_placement_groups, 'DescribePlacementGroups'

      # Calls the DescribeRegions API operation.
      # @method describe_regions(options = {})
      # @param [Hash] options
      #   * +:region_names+ - (Array<String>) The optional list of regions to
      #     describe.
      #   * +:filters+ - (Array<Hash>) A list of filters used to match
      #     properties for Regions. For a complete reference to the available
      #     filter keys for this operation, see the Amazon EC2 API reference.
      #     * +:name+ - (String) Specifies the name of the filter.
      #     * +:values+ - (Array<String>) Contains one or more values for the
      #       filter.
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #   * +:region_info+ - (Array<>)
      define_client_method :describe_regions, 'DescribeRegions'

      # Calls the DescribeReservedInstances API operation.
      # @method describe_reserved_instances(options = {})
      # @param [Hash] options
      #   * +:reserved_instances_ids+ - (Array<String>) The optional list of
      #     Reserved Instance IDs to describe.
      #   * +:filters+ - (Array<Hash>) A list of filters used to match
      #     properties for ReservedInstances. For a complete reference to the
      #     available filter keys for this operation, see the Amazon EC2 API
      #     reference.
      #     * +:name+ - (String) Specifies the name of the filter.
      #     * +:values+ - (Array<String>) Contains one or more values for the
      #       filter.
      #   * +:offering_type+ - (String) The Reserved Instance offering type.
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #   * +:reserved_instances_set+ - (Array<Hash>)
      #     * +:start+ - (Time)
      #     * +:duration+ - (Integer)
      #     * +:usage_price+ - (Numeric)
      #     * +:fixed_price+ - (Numeric)
      #     * +:instance_count+ - (Integer)
      #     * +:tag_set+ - (Array<>)
      #     * +:recurring_charges+ - (Array<Hash>)
      #       * +:amount+ - (Numeric)
      define_client_method :describe_reserved_instances, 'DescribeReservedInstances'

      # Calls the DescribeReservedInstancesOfferings API operation.
      # @method describe_reserved_instances_offerings(options = {})
      # @param [Hash] options
      #   * +:reserved_instances_offering_ids+ - (Array<String>) An optional
      #     list of the unique IDs of the Reserved Instance offerings to
      #     describe.
      #   * +:instance_type+ - (String) The instance type on which the Reserved
      #     Instance can be used.
      #   * +:availability_zone+ - (String) The Availability Zone in which the
      #     Reserved Instance can be used.
      #   * +:product_description+ - (String) The Reserved Instance product
      #     description.
      #   * +:filters+ - (Array<Hash>) A list of filters used to match
      #     properties for ReservedInstancesOfferings. For a complete reference
      #     to the available filter keys for this operation, see the Amazon EC2
      #     API reference.
      #     * +:name+ - (String) Specifies the name of the filter.
      #     * +:values+ - (Array<String>) Contains one or more values for the
      #       filter.
      #   * +:instance_tenancy+ - (String) The tenancy of the Reserved Instance
      #     offering. A Reserved Instance with tenancy of dedicated will run on
      #     single-tenant hardware and can only be launched within a VPC.
      #   * +:offering_type+ - (String) The Reserved Instance offering type.
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #   * +:reserved_instances_offerings_set+ - (Array<Hash>)
      #     * +:duration+ - (Integer)
      #     * +:usage_price+ - (Numeric)
      #     * +:fixed_price+ - (Numeric)
      #     * +:recurring_charges+ - (Array<Hash>)
      #       * +:amount+ - (Numeric)
      define_client_method :describe_reserved_instances_offerings, 'DescribeReservedInstancesOfferings'

      # Calls the DescribeRouteTables API operation.
      # @method describe_route_tables(options = {})
      # @param [Hash] options
      #   * +:route_table_ids+ - (Array<String>) One or more route table IDs.
      #   * +:filters+ - (Array<Hash>) A list of filters used to match
      #     properties for Route Tables. For a complete reference to the
      #     available filter keys for this operation, see the Amazon EC2 API
      #     reference.
      #     * +:name+ - (String) Specifies the name of the filter.
      #     * +:values+ - (Array<String>) Contains one or more values for the
      #       filter.
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #   * +:route_table_set+ - (Array<Hash>)
      #     * +:route_set+ - (Array<>)
      #     * +:association_set+ - (Array<Hash>)
      #       * +:main+ - (Boolean)
      #     * +:tag_set+ - (Array<>)
      define_client_method :describe_route_tables, 'DescribeRouteTables'

      # Calls the DescribeSecurityGroups API operation.
      # @method describe_security_groups(options = {})
      # @param [Hash] options
      #   * +:group_names+ - (Array<String>) The optional list of Amazon EC2
      #     security groups to describe.
      #   * +:group_ids+ - (Array<String>)
      #   * +:filters+ - (Array<Hash>) A list of filters used to match
      #     properties for SecurityGroups. For a complete reference to the
      #     available filter keys for this operation, see the Amazon EC2 API
      #     reference.
      #     * +:name+ - (String) Specifies the name of the filter.
      #     * +:values+ - (Array<String>) Contains one or more values for the
      #       filter.
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #   * +:security_group_info+ - (Array<Hash>)
      #     * +:ip_permissions+ - (Array<Hash>)
      #       * +:from_port+ - (Integer)
      #       * +:to_port+ - (Integer)
      #       * +:groups+ - (Array<>)
      #       * +:ip_ranges+ - (Array<>)
      #       * +:ip_protocol+ - (String)
      #     * +:ip_permissions_egress+ - (Array<Hash>)
      #       * +:from_port+ - (Integer)
      #       * +:to_port+ - (Integer)
      #       * +:groups+ - (Array<>)
      #       * +:ip_ranges+ - (Array<>)
      #     * +:tag_set+ - (Array<>)
      define_client_method :describe_security_groups, 'DescribeSecurityGroups'

      # Calls the DescribeSnapshotAttribute API operation.
      # @method describe_snapshot_attribute(options = {})
      # @param [Hash] options
      #   * +:snapshot_id+ - *required* - (String) The ID of the EBS snapshot
      #     whose attribute is being described.
      #   * +:attribute+ - *required* - (String) The name of the EBS attribute
      #     to describe. Available attribute names: createVolumePermission
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #   * +:create_volume_permission+ - (Array<>)
      #   * +:product_codes+ - (Array<>)
      define_client_method :describe_snapshot_attribute, 'DescribeSnapshotAttribute'

      # Calls the DescribeSnapshots API operation.
      # @method describe_snapshots(options = {})
      # @param [Hash] options
      #   * +:snapshot_ids+ - (Array<String>) The optional list of EBS snapshot
      #     IDs to describe.
      #   * +:owner_ids+ - (Array<String>) The optional list of EBS snapshot
      #     owners.
      #   * +:restorable_by_user_ids+ - (Array<String>) The optional list of
      #     users who have permission to create volumes from the described EBS
      #     snapshots.
      #   * +:filters+ - (Array<Hash>) A list of filters used to match
      #     properties for Snapshots. For a complete reference to the available
      #     filter keys for this operation, see the Amazon EC2 API reference.
      #     * +:name+ - (String) Specifies the name of the filter.
      #     * +:values+ - (Array<String>) Contains one or more values for the
      #       filter.
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #   * +:snapshot_set+ - (Array<Hash>)
      #     * +:start_time+ - (Time)
      #     * +:volume_size+ - (Integer)
      #     * +:tag_set+ - (Array<>)
      define_client_method :describe_snapshots, 'DescribeSnapshots'

      # Calls the DescribeSpotDatafeedSubscription API operation.
      # @method describe_spot_datafeed_subscription(options = {})
      # @param [Hash] options
      # @return [Core::Response]
      define_client_method :describe_spot_datafeed_subscription, 'DescribeSpotDatafeedSubscription'

      # Calls the DescribeSpotInstanceRequests API operation.
      # @method describe_spot_instance_requests(options = {})
      # @param [Hash] options
      #   * +:spot_instance_request_ids+ - (Array<String>) The ID of the
      #     request.
      #   * +:filters+ - (Array<Hash>) A list of filters used to match
      #     properties for SpotInstances. For a complete reference to the
      #     available filter keys for this operation, see the Amazon EC2 API
      #     reference.
      #     * +:name+ - (String) Specifies the name of the filter.
      #     * +:values+ - (Array<String>) Contains one or more values for the
      #       filter.
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #   * +:spot_instance_request_set+ - (Array<Hash>)
      #     * +:valid_from+ - (Time)
      #     * +:valid_until+ - (Time)
      #     * +:launch_specification+ - (Hash)
      #       * +:group_set+ - (Array<>)
      #       * +:block_device_mapping+ - (Array<Hash>)
      #         * +:ebs+ - (Hash)
      #           * +:volume_size+ - (Integer)
      #           * +:delete_on_termination+ - (Boolean)
      #           * +:iops+ - (Integer)
      #       * +:monitoring_enabled+ - (Boolean)
      #       * +:network_interface_set+ - (Array<Hash>)
      #         * +:device_index+ - (Integer)
      #         * +:security_group_id+ - (Array<>)
      #         * +:delete_on_termination+ - (Boolean)
      #         * +:private_ip_addresses_set+ - (Array<Hash>)
      #           * +:primary+ - (Boolean)
      #         * +:secondary_private_ip_address_count+ - (Integer)
      #       * +:ebs_optimized+ - (Boolean)
      #     * +:create_time+ - (Time)
      #     * +:tag_set+ - (Array<>)
      define_client_method :describe_spot_instance_requests, 'DescribeSpotInstanceRequests'

      # Calls the DescribeSpotPriceHistory API operation.
      # @method describe_spot_price_history(options = {})
      # @param [Hash] options
      #   * +:start_time+ - (String<ISO8601 datetime>) The start date and time
      #     of the Spot Instance price history data.
      #   * +:end_time+ - (String<ISO8601 datetime>) The end date and time of
      #     the Spot Instance price history data.
      #   * +:instance_types+ - (Array<String>) Specifies the instance type to
      #     return.
      #   * +:product_descriptions+ - (Array<String>) The description of the
      #     AMI.
      #   * +:filters+ - (Array<Hash>) A list of filters used to match
      #     properties for SpotPriceHistory. For a complete reference to the
      #     available filter keys for this operation, see the Amazon EC2 API
      #     reference.
      #     * +:name+ - (String) Specifies the name of the filter.
      #     * +:values+ - (Array<String>) Contains one or more values for the
      #       filter.
      #   * +:availability_zone+ - (String) Filters the results by availability
      #     zone (ex: 'us-east-1a').
      #   * +:max_results+ - (Integer) Specifies the number of rows to return.
      #   * +:next_token+ - (String) Specifies the next set of rows to return.
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #   * +:spot_price_history_set+ - (Array<Hash>)
      #     * +:timestamp+ - (Time)
      define_client_method :describe_spot_price_history, 'DescribeSpotPriceHistory'

      # Calls the DescribeSubnets API operation.
      # @method describe_subnets(options = {})
      # @param [Hash] options
      #   * +:subnet_ids+ - (Array<String>) A set of one or more subnet IDs.
      #   * +:filters+ - (Array<Hash>) A list of filters used to match
      #     properties for Subnets. For a complete reference to the available
      #     filter keys for this operation, see the Amazon EC2 API reference.
      #     * +:name+ - (String) Specifies the name of the filter.
      #     * +:values+ - (Array<String>) Contains one or more values for the
      #       filter.
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #   * +:subnet_set+ - (Array<Hash>)
      #     * +:available_ip_address_count+ - (Integer)
      #     * +:tag_set+ - (Array<>)
      define_client_method :describe_subnets, 'DescribeSubnets'

      # Calls the DescribeTags API operation.
      # @method describe_tags(options = {})
      # @param [Hash] options
      #   * +:filters+ - (Array<Hash>) A list of filters used to match
      #     properties for tags.
      #     * +:name+ - (String) Specifies the name of the filter.
      #     * +:values+ - (Array<String>) Contains one or more values for the
      #       filter.
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #   * +:tag_set+ - (Array<>)
      define_client_method :describe_tags, 'DescribeTags'

      # Calls the DescribeVolumeAttribute API operation.
      # @method describe_volume_attribute(options = {})
      # @param [Hash] options
      #   * +:volume_id+ - *required* - (String)
      #   * +:attribute+ - (String)
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #   * +:auto_enable_io+ - (Hash)
      #     * +:value+ - (Boolean)
      #   * +:product_codes+ - (Array<>)
      define_client_method :describe_volume_attribute, 'DescribeVolumeAttribute'

      # Calls the DescribeVolumeStatus API operation.
      # @method describe_volume_status(options = {})
      # @param [Hash] options
      #   * +:volume_ids+ - (Array<String>)
      #   * +:filters+ - (Array<Hash>)
      #     * +:name+ - (String) Specifies the name of the filter.
      #     * +:values+ - (Array<String>) Contains one or more values for the
      #       filter.
      #   * +:next_token+ - (String)
      #   * +:max_results+ - (Integer)
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #   * +:volume_status_set+ - (Array<Hash>)
      #     * +:volume_status+ - (Hash)
      #       * +:details+ - (Array<>)
      #     * +:events_set+ - (Array<Hash>)
      #       * +:not_before+ - (Time)
      #       * +:not_after+ - (Time)
      #     * +:actions_set+ - (Array<>)
      define_client_method :describe_volume_status, 'DescribeVolumeStatus'

      # Calls the DescribeVolumes API operation.
      # @method describe_volumes(options = {})
      # @param [Hash] options
      #   * +:volume_ids+ - (Array<String>) The optional list of EBS volumes to
      #     describe.
      #   * +:filters+ - (Array<Hash>) A list of filters used to match
      #     properties for Volumes. For a complete reference to the available
      #     filter keys for this operation, see the Amazon EC2 API reference.
      #     * +:name+ - (String) Specifies the name of the filter.
      #     * +:values+ - (Array<String>) Contains one or more values for the
      #       filter.
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #   * +:volume_set+ - (Array<Hash>)
      #     * +:size+ - (Integer)
      #     * +:create_time+ - (Time)
      #     * +:attachment_set+ - (Array<Hash>)
      #       * +:attach_time+ - (Time)
      #       * +:delete_on_termination+ - (Boolean)
      #     * +:tag_set+ - (Array<>)
      #     * +:iops+ - (Integer)
      define_client_method :describe_volumes, 'DescribeVolumes'

      # Calls the DescribeVpcs API operation.
      # @method describe_vpcs(options = {})
      # @param [Hash] options
      #   * +:vpc_ids+ - (Array<String>) The ID of a VPC you want information
      #     about.
      #   * +:filters+ - (Array<Hash>) A list of filters used to match
      #     properties for VPCs. For a complete reference to the available
      #     filter keys for this operation, see the Amazon EC2 API reference.
      #     * +:name+ - (String) Specifies the name of the filter.
      #     * +:values+ - (Array<String>) Contains one or more values for the
      #       filter.
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #   * +:vpc_set+ - (Array<Hash>)
      #     * +:tag_set+ - (Array<>)
      define_client_method :describe_vpcs, 'DescribeVpcs'

      # Calls the DescribeVpnConnections API operation.
      # @method describe_vpn_connections(options = {})
      # @param [Hash] options
      #   * +:vpn_connection_ids+ - (Array<String>) A VPN connection ID. More
      #     than one may be specified per request.
      #   * +:filters+ - (Array<Hash>) A list of filters used to match
      #     properties for VPN Connections. For a complete reference to the
      #     available filter keys for this operation, see the Amazon EC2 API
      #     reference.
      #     * +:name+ - (String) Specifies the name of the filter.
      #     * +:values+ - (Array<String>) Contains one or more values for the
      #       filter.
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #   * +:vpn_connection_set+ - (Array<Hash>)
      #     * +:tag_set+ - (Array<>)
      #     * +:vgw_telemetry+ - (Array<Hash>)
      #       * +:last_status_change+ - (Time)
      #       * +:accepted_route_count+ - (Integer)
      #     * +:vpn_type+ - (String)
      define_client_method :describe_vpn_connections, 'DescribeVpnConnections'

      # Calls the DescribeVpnGateways API operation.
      # @method describe_vpn_gateways(options = {})
      # @param [Hash] options
      #   * +:vpn_gateway_ids+ - (Array<String>) A list of filters used to
      #     match properties for VPN Gateways. For a complete reference to the
      #     available filter keys for this operation, see the Amazon EC2 API
      #     reference.
      #   * +:filters+ - (Array<Hash>) A list of filters used to match
      #     properties for VPN Gateways. For a complete reference to the
      #     available filter keys for this operation, see the Amazon EC2 API
      #     reference.
      #     * +:name+ - (String) Specifies the name of the filter.
      #     * +:values+ - (Array<String>) Contains one or more values for the
      #       filter.
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #   * +:vpn_gateway_set+ - (Array<Hash>)
      #     * +:attachments+ - (Array<>)
      #     * +:tag_set+ - (Array<>)
      #     * +:vpn_type+ - (String)
      define_client_method :describe_vpn_gateways, 'DescribeVpnGateways'

      # Calls the DetachInternetGateway API operation.
      # @method detach_internet_gateway(options = {})
      # @param [Hash] options
      #   * +:internet_gateway_id+ - *required* - (String) The ID of the
      #     Internet gateway to detach.
      #   * +:vpc_id+ - *required* - (String) The ID of the VPC.
      # @return [Core::Response]
      define_client_method :detach_internet_gateway, 'DetachInternetGateway'

      # Calls the DetachNetworkInterface API operation.
      # @method detach_network_interface(options = {})
      # @param [Hash] options
      #   * +:attachment_id+ - *required* - (String)
      #   * +:force+ - (Boolean)
      # @return [Core::Response]
      define_client_method :detach_network_interface, 'DetachNetworkInterface'

      # Calls the DetachVolume API operation.
      # @method detach_volume(options = {})
      # @param [Hash] options
      #   * +:volume_id+ - *required* - (String) The ID of the volume to
      #     detach.
      #   * +:instance_id+ - (String) The ID of the instance from which to
      #     detach the the specified volume.
      #   * +:device+ - (String) The device name to which the volume is
      #     attached on the specified instance.
      #   * +:force+ - (Boolean) Forces detachment if the previous detachment
      #     attempt did not occur cleanly (logging into an instance, unmounting
      #     the volume, and detaching normally). This option can lead to data
      #     loss or a corrupted file system. Use this option only as a last
      #     resort to detach a volume from a failed instance. The instance will
      #     not have an opportunity to flush file system caches nor file system
      #     meta data. If you use this option, you must perform file system
      #     check and repair procedures.
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #   * +:attach_time+ - (Time)
      #   * +:delete_on_termination+ - (Boolean)
      define_client_method :detach_volume, 'DetachVolume'

      # Calls the DetachVpnGateway API operation.
      # @method detach_vpn_gateway(options = {})
      # @param [Hash] options
      #   * +:vpn_gateway_id+ - *required* - (String) The ID of the VPN gateway
      #     to detach from the VPC.
      #   * +:vpc_id+ - *required* - (String) The ID of the VPC to detach the
      #     VPN gateway from.
      # @return [Core::Response]
      define_client_method :detach_vpn_gateway, 'DetachVpnGateway'

      # Calls the DisassociateAddress API operation.
      # @method disassociate_address(options = {})
      # @param [Hash] options
      #   * +:public_ip+ - (String) The elastic IP address that you are
      #     disassociating from the instance.
      #   * +:association_id+ - (String) Association ID corresponding to the
      #     VPC elastic IP address you want to disassociate.
      # @return [Core::Response]
      define_client_method :disassociate_address, 'DisassociateAddress'

      # Calls the DisassociateRouteTable API operation.
      # @method disassociate_route_table(options = {})
      # @param [Hash] options
      #   * +:association_id+ - *required* - (String) The association ID
      #     representing the current association between the route table and
      #     subnet.
      # @return [Core::Response]
      define_client_method :disassociate_route_table, 'DisassociateRouteTable'

      # Calls the EnableVolumeIO API operation.
      # @method enable_volume_io(options = {})
      # @param [Hash] options
      #   * +:volume_id+ - *required* - (String)
      # @return [Core::Response]
      define_client_method :enable_volume_io, 'EnableVolumeIO'

      # Calls the GetConsoleOutput API operation.
      # @method get_console_output(options = {})
      # @param [Hash] options
      #   * +:instance_id+ - *required* - (String) The ID of the instance for
      #     which you want console output.
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #   * +:timestamp+ - (Time)
      define_client_method :get_console_output, 'GetConsoleOutput'

      # Calls the GetPasswordData API operation.
      # @method get_password_data(options = {})
      # @param [Hash] options
      #   * +:instance_id+ - *required* - (String) The ID of the instance for
      #     which you want the Windows administrator password.
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #   * +:timestamp+ - (Time)
      define_client_method :get_password_data, 'GetPasswordData'

      # Calls the ImportInstance API operation.
      # @method import_instance(options = {})
      # @param [Hash] options
      #   * +:description+ - (String)
      #   * +:launch_specification+ - (Hash)
      #     * +:architecture+ - (String)
      #     * +:security_groups+ - (Array<String>)
      #     * +:additional_info+ - (String)
      #     * +:user_data+ - (String)
      #     * +:instance_type+ - (String)
      #     * +:placement+ - (Hash)
      #       * +:availability_zone+ - (String) The availability zone in which
      #         an Amazon EC2 instance runs.
      #       * +:group_name+ - (String) The name of the PlacementGroup in
      #         which an Amazon EC2 instance runs. Placement groups are
      #         primarily used for launching High Performance Computing
      #         instances in the same group to ensure fast connection speeds.
      #       * +:tenancy+ - (String) The allowed tenancy of instances launched
      #         into the VPC. A value of default means instances can be
      #         launched with any tenancy; a value of dedicated means all
      #         instances launched into the VPC will be launched as dedicated
      #         tenancy regardless of the tenancy assigned to the instance at
      #         launch.
      #     * +:block_device_mappings+ - (Array<Hash>)
      #       * +:virtual_name+ - (String) Specifies the virtual device name.
      #       * +:device_name+ - (String) Specifies the device name (e.g.,
      #         /dev/sdh).
      #       * +:ebs+ - (Hash) Specifies parameters used to automatically
      #         setup Amazon EBS volumes when the instance is launched.
      #         * +:snapshot_id+ - (String) The ID of the snapshot from which
      #           the volume will be created.
      #         * +:volume_size+ - (Integer) The size of the volume, in
      #           gigabytes.
      #         * +:delete_on_termination+ - (Boolean) Specifies whether the
      #           Amazon EBS volume is deleted on instance termination.
      #         * +:volume_type+ - (String)
      #         * +:iops+ - (Integer)
      #       * +:no_device+ - (String) Specifies the device name to suppress
      #         during instance launch.
      #     * +:monitoring+ - (Boolean)
      #     * +:subnet_id+ - (String)
      #     * +:disable_api_termination+ - (Boolean)
      #     * +:instance_initiated_shutdown_behavior+ - (String)
      #     * +:private_ip_address+ - (String)
      #   * +:disk_images+ - (Array<Hash>)
      #     * +:image+ - (Hash)
      #       * +:format+ - *required* - (String)
      #       * +:bytes+ - *required* - (Integer)
      #       * +:import_manifest_url+ - *required* - (String)
      #     * +:description+ - (String)
      #     * +:volume+ - (Hash)
      #       * +:size+ - *required* - (Integer)
      #   * +:platform+ - *required* - (String)
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #   * +:conversion_task+ - (Hash)
      #     * +:import_instance+ - (Hash)
      #       * +:volumes+ - (Array<Hash>)
      #         * +:bytes_converted+ - (Integer)
      #         * +:image+ - (Hash)
      #           * +:size+ - (Integer)
      #         * +:volume+ - (Hash)
      #           * +:size+ - (Integer)
      #     * +:import_volume+ - (Hash)
      #       * +:bytes_converted+ - (Integer)
      #       * +:image+ - (Hash)
      #         * +:size+ - (Integer)
      #       * +:volume+ - (Hash)
      #         * +:size+ - (Integer)
      #     * +:tag_set+ - (Array<>)
      define_client_method :import_instance, 'ImportInstance'

      # Calls the ImportKeyPair API operation.
      # @method import_key_pair(options = {})
      # @param [Hash] options
      #   * +:key_name+ - *required* - (String) The unique name for the key
      #     pair.
      #   * +:public_key_material+ - *required* - (String) The public key
      #     portion of the key pair being imported.
      # @return [Core::Response]
      define_client_method :import_key_pair, 'ImportKeyPair'

      # Calls the ImportVolume API operation.
      # @method import_volume(options = {})
      # @param [Hash] options
      #   * +:availability_zone+ - (String)
      #   * +:image+ - (Hash)
      #     * +:format+ - *required* - (String)
      #     * +:bytes+ - *required* - (Integer)
      #     * +:import_manifest_url+ - *required* - (String)
      #   * +:description+ - (String)
      #   * +:volume+ - (Hash)
      #     * +:size+ - *required* - (Integer)
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #   * +:conversion_task+ - (Hash)
      #     * +:import_instance+ - (Hash)
      #       * +:volumes+ - (Array<Hash>)
      #         * +:bytes_converted+ - (Integer)
      #         * +:image+ - (Hash)
      #           * +:size+ - (Integer)
      #         * +:volume+ - (Hash)
      #           * +:size+ - (Integer)
      #     * +:import_volume+ - (Hash)
      #       * +:bytes_converted+ - (Integer)
      #       * +:image+ - (Hash)
      #         * +:size+ - (Integer)
      #       * +:volume+ - (Hash)
      #         * +:size+ - (Integer)
      #     * +:tag_set+ - (Array<>)
      define_client_method :import_volume, 'ImportVolume'

      # Calls the ModifyImageAttribute API operation.
      # @method modify_image_attribute(options = {})
      # @param [Hash] options
      #   * +:image_id+ - *required* - (String) The ID of the AMI whose
      #     attribute you want to modify.
      #   * +:attribute+ - (String) The name of the AMI attribute you want to
      #     modify. Available attributes: launchPermission, productCodes
      #   * +:operation_type+ - (String) The type of operation being requested.
      #     Available operation types: add, remove
      #   * +:user_ids+ - (Array<String>) The AWS user ID being added to or
      #     removed from the list of users with launch permissions for this
      #     AMI. Only valid when the launchPermission attribute is being
      #     modified.
      #   * +:user_groups+ - (Array<String>) The user group being added to or
      #     removed from the list of user groups with launch permissions for
      #     this AMI. Only valid when the launchPermission attribute is being
      #     modified. Available user groups: all
      #   * +:product_codes+ - (Array<String>) The list of product codes being
      #     added to or removed from the specified AMI. Only valid when the
      #     productCodes attribute is being modified.
      #   * +:value+ - (String) The value of the attribute being modified. Only
      #     valid when the description attribute is being modified.
      #   * +:launch_permission+ - (Hash)
      #     * +:add+ - (Array<Hash>)
      #       * +:user_id+ - (String) The AWS user ID of the user involved in
      #         this launch permission.
      #       * +:group+ - (String) The AWS group of the user involved in this
      #         launch permission. Available groups: all
      #     * +:remove+ - (Array<Hash>)
      #       * +:user_id+ - (String) The AWS user ID of the user involved in
      #         this launch permission.
      #       * +:group+ - (String) The AWS group of the user involved in this
      #         launch permission. Available groups: all
      #   * +:description+ - (Hash)
      #     * +:value+ - (String) String value
      # @return [Core::Response]
      define_client_method :modify_image_attribute, 'ModifyImageAttribute'

      # Calls the ModifyInstanceAttribute API operation.
      # @method modify_instance_attribute(options = {})
      # @param [Hash] options
      #   * +:instance_id+ - *required* - (String) The ID of the instance whose
      #     attribute is being modified.
      #   * +:attribute+ - (String) The name of the attribute being modified.
      #     Available attribute names: instanceType, kernel, ramdisk, userData,
      #     disableApiTermination, instanceInitiatedShutdownBehavior,
      #     rootDevice, blockDeviceMapping
      #   * +:value+ - (String) The new value of the instance attribute being
      #     modified. Only valid when kernel, ramdisk, userData,
      #     disableApiTermination or instanceInitiateShutdownBehavior is
      #     specified as the attribute being modified.
      #   * +:block_device_mappings+ - (Array<Hash>) The new block device
      #     mappings for the instance whose attributes are being modified. Only
      #     valid when blockDeviceMapping is specified as the attribute being
      #     modified.
      #     * +:device_name+ - (String) The device name (e.g., /dev/sdh) at
      #       which the block device is exposed on the instance.
      #     * +:ebs+ - (Hash) The EBS instance block device specification
      #       describing the EBS block device to map to the specified device
      #       name on a running instance.
      #       * +:volume_id+ - (String) The ID of the EBS volume that should be
      #         mounted as a block device on an Amazon EC2 instance.
      #       * +:delete_on_termination+ - (Boolean) Specifies whether the
      #         Amazon EBS volume is deleted on instance termination.
      #     * +:virtual_name+ - (String) The virtual device name.
      #     * +:no_device+ - (String) When set to the empty string, specifies
      #       that the device name in this object should not be mapped to any
      #       real device.
      #   * +:source_dest_check+ - (Hash)
      #     * +:value+ - (Boolean) Boolean value
      #   * +:disable_api_termination+ - (Hash)
      #     * +:value+ - (Boolean) Boolean value
      #   * +:instance_type+ - (Hash)
      #     * +:value+ - (String) String value
      #   * +:kernel+ - (Hash)
      #     * +:value+ - (String) String value
      #   * +:ramdisk+ - (Hash)
      #     * +:value+ - (String) String value
      #   * +:user_data+ - (Hash)
      #     * +:value+ - (String) String value
      #   * +:instance_initiated_shutdown_behavior+ - (Hash)
      #     * +:value+ - (String) String value
      #   * +:groups+ - (Array<String>)
      #   * +:ebs_optimized+ - (Hash)
      #     * +:value+ - (Boolean) Boolean value
      # @return [Core::Response]
      define_client_method :modify_instance_attribute, 'ModifyInstanceAttribute'

      # Calls the ModifyNetworkInterfaceAttribute API operation.
      # @method modify_network_interface_attribute(options = {})
      # @param [Hash] options
      #   * +:network_interface_id+ - *required* - (String)
      #   * +:description+ - (Hash)
      #     * +:value+ - (String) String value
      #   * +:source_dest_check+ - (Hash)
      #     * +:value+ - (Boolean) Boolean value
      #   * +:groups+ - (Array<String>)
      #   * +:attachment+ - (Hash)
      #     * +:attachment_id+ - (String)
      #     * +:delete_on_termination+ - (Boolean)
      # @return [Core::Response]
      define_client_method :modify_network_interface_attribute, 'ModifyNetworkInterfaceAttribute'

      # Calls the ModifySnapshotAttribute API operation.
      # @method modify_snapshot_attribute(options = {})
      # @param [Hash] options
      #   * +:snapshot_id+ - *required* - (String) The ID of the EBS snapshot
      #     whose attributes are being modified.
      #   * +:attribute+ - (String) The name of the attribute being modified.
      #     Available attribute names: createVolumePermission
      #   * +:operation_type+ - (String) The operation to perform on the
      #     attribute. Available operation names: add, remove
      #   * +:user_ids+ - (Array<String>) The AWS user IDs to add to or remove
      #     from the list of users that have permission to create EBS volumes
      #     from the specified snapshot. Currently supports "all". Only valid
      #     when the createVolumePermission attribute is being modified.
      #   * +:group_names+ - (Array<String>) The AWS group names to add to or
      #     remove from the list of groups that have permission to create EBS
      #     volumes from the specified snapshot. Currently supports "all". Only
      #     valid when the createVolumePermission attribute is being modified.
      #   * +:create_volume_permission+ - (Hash)
      #     * +:add+ - (Array<Hash>)
      #       * +:user_id+ - (String) The user ID of the user that can create
      #         volumes from the snapshot.
      #       * +:group+ - (String) The group that is allowed to create volumes
      #         from the snapshot (currently supports "all").
      #     * +:remove+ - (Array<Hash>)
      #       * +:user_id+ - (String) The user ID of the user that can create
      #         volumes from the snapshot.
      #       * +:group+ - (String) The group that is allowed to create volumes
      #         from the snapshot (currently supports "all").
      # @return [Core::Response]
      define_client_method :modify_snapshot_attribute, 'ModifySnapshotAttribute'

      # Calls the ModifyVolumeAttribute API operation.
      # @method modify_volume_attribute(options = {})
      # @param [Hash] options
      #   * +:volume_id+ - *required* - (String)
      #   * +:auto_enable_io+ - (Boolean)
      # @return [Core::Response]
      define_client_method :modify_volume_attribute, 'ModifyVolumeAttribute'

      # Calls the MonitorInstances API operation.
      # @method monitor_instances(options = {})
      # @param [Hash] options
      #   * +:instance_ids+ - *required* - (Array<String>) The list of Amazon
      #     EC2 instances on which to enable monitoring.
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #   * +:instances_set+ - (Array<>)
      define_client_method :monitor_instances, 'MonitorInstances'

      # Calls the PurchaseReservedInstancesOffering API operation.
      # @method purchase_reserved_instances_offering(options = {})
      # @param [Hash] options
      #   * +:reserved_instances_offering_id+ - *required* - (String) The
      #     unique ID of the Reserved Instances offering being purchased.
      #   * +:instance_count+ - *required* - (Integer) The number of Reserved
      #     Instances to purchase.
      # @return [Core::Response]
      define_client_method :purchase_reserved_instances_offering, 'PurchaseReservedInstancesOffering'

      # Calls the RebootInstances API operation.
      # @method reboot_instances(options = {})
      # @param [Hash] options
      #   * +:instance_ids+ - *required* - (Array<String>) The list of
      #     instances to terminate.
      # @return [Core::Response]
      define_client_method :reboot_instances, 'RebootInstances'

      # Calls the RegisterImage API operation.
      # @method register_image(options = {})
      # @param [Hash] options
      #   * +:image_location+ - (String) The full path to your AMI manifest in
      #     Amazon S3 storage.
      #   * +:name+ - (String) The name to give the new Amazon Machine Image.
      #     Constraints: 3-128 alphanumeric characters, parenthesis (()),
      #     commas (,), slashes (/), dashes (-), or underscores(_)
      #   * +:description+ - (String) The description describing the new AMI.
      #   * +:architecture+ - (String) The architecture of the image. Valid
      #     Values: i386, x86_64
      #   * +:kernel_id+ - (String) The optional ID of a specific kernel to
      #     register with the new AMI.
      #   * +:ramdisk_id+ - (String) The optional ID of a specific ramdisk to
      #     register with the new AMI. Some kernels require additional drivers
      #     at launch. Check the kernel requirements for information on whether
      #     you need to specify a RAM disk.
      #   * +:root_device_name+ - (String) The root device name (e.g.,
      #     /dev/sda1).
      #   * +:block_device_mappings+ - (Array<Hash>) The block device mappings
      #     for the new AMI, which specify how different block devices (ex: EBS
      #     volumes and ephemeral drives) will be exposed on instances launched
      #     from the new image.
      #     * +:virtual_name+ - (String) Specifies the virtual device name.
      #     * +:device_name+ - (String) Specifies the device name (e.g.,
      #       /dev/sdh).
      #     * +:ebs+ - (Hash) Specifies parameters used to automatically setup
      #       Amazon EBS volumes when the instance is launched.
      #       * +:snapshot_id+ - (String) The ID of the snapshot from which the
      #         volume will be created.
      #       * +:volume_size+ - (Integer) The size of the volume, in
      #         gigabytes.
      #       * +:delete_on_termination+ - (Boolean) Specifies whether the
      #         Amazon EBS volume is deleted on instance termination.
      #       * +:volume_type+ - (String)
      #       * +:iops+ - (Integer)
      #     * +:no_device+ - (String) Specifies the device name to suppress
      #       during instance launch.
      # @return [Core::Response]
      define_client_method :register_image, 'RegisterImage'

      # Calls the ReleaseAddress API operation.
      # @method release_address(options = {})
      # @param [Hash] options
      #   * +:public_ip+ - (String) The elastic IP address that you are
      #     releasing from your account.
      #   * +:allocation_id+ - (String) The allocation ID that AWS provided
      #     when you allocated the address for use with Amazon VPC.
      # @return [Core::Response]
      define_client_method :release_address, 'ReleaseAddress'

      # Calls the ReplaceNetworkAclAssociation API operation.
      # @method replace_network_acl_association(options = {})
      # @param [Hash] options
      #   * +:association_id+ - *required* - (String) The ID representing the
      #     current association between the original network ACL and the
      #     subnet.
      #   * +:network_acl_id+ - *required* - (String) The ID of the new ACL to
      #     associate with the subnet.
      # @return [Core::Response]
      define_client_method :replace_network_acl_association, 'ReplaceNetworkAclAssociation'

      # Calls the ReplaceNetworkAclEntry API operation.
      # @method replace_network_acl_entry(options = {})
      # @param [Hash] options
      #   * +:network_acl_id+ - *required* - (String) ID of the ACL where the
      #     entry will be replaced.
      #   * +:rule_number+ - *required* - (Integer) Rule number of the entry to
      #     replace.
      #   * +:protocol+ - *required* - (String) IP protocol the rule applies
      #     to. Valid Values: tcp, udp, icmp or an IP protocol number.
      #   * +:rule_action+ - *required* - (String) Whether to allow or deny
      #     traffic that matches the rule.
      #   * +:egress+ - *required* - (Boolean) Whether this rule applies to
      #     egress traffic from the subnet ( +true+ ) or ingress traffic (
      #     +false+ ).
      #   * +:cidr_block+ - *required* - (String) The CIDR range to allow or
      #     deny, in CIDR notation (e.g., 172.16.0.0/24).
      #   * +:icmp_type_code+ - (Hash) ICMP values.
      #     * +:type+ - (Integer) For the ICMP protocol, the ICMP type. A value
      #       of -1 is a wildcard meaning all types. Required if specifying
      #       icmp for the protocol.
      #     * +:code+ - (Integer) For the ICMP protocol, the ICMP code. A value
      #       of -1 is a wildcard meaning all codes. Required if specifying
      #       icmp for the protocol.
      #   * +:port_range+ - (Hash) Port ranges.
      #     * +:from+ - (Integer) The first port in the range. Required if
      #       specifying tcp or udp for the protocol.
      #     * +:to+ - (Integer) The last port in the range. Required if
      #       specifying tcp or udp for the protocol.
      # @return [Core::Response]
      define_client_method :replace_network_acl_entry, 'ReplaceNetworkAclEntry'

      # Calls the ReplaceRoute API operation.
      # @method replace_route(options = {})
      # @param [Hash] options
      #   * +:route_table_id+ - *required* - (String) The ID of the route table
      #     where the route will be replaced.
      #   * +:destination_cidr_block+ - *required* - (String) The CIDR address
      #     block used for the destination match. For example: 0.0.0.0/0. The
      #     value you provide must match the CIDR of an existing route in the
      #     table.
      #   * +:gateway_id+ - (String) The ID of a VPN or Internet gateway
      #     attached to your VPC.
      #   * +:instance_id+ - (String) The ID of a NAT instance in your VPC.
      #   * +:network_interface_id+ - (String)
      # @return [Core::Response]
      define_client_method :replace_route, 'ReplaceRoute'

      # Calls the ReplaceRouteTableAssociation API operation.
      # @method replace_route_table_association(options = {})
      # @param [Hash] options
      #   * +:association_id+ - *required* - (String) The ID representing the
      #     current association between the original route table and the
      #     subnet.
      #   * +:route_table_id+ - *required* - (String) The ID of the new route
      #     table to associate with the subnet.
      # @return [Core::Response]
      define_client_method :replace_route_table_association, 'ReplaceRouteTableAssociation'

      # Calls the ReportInstanceStatus API operation.
      # @method report_instance_status(options = {})
      # @param [Hash] options
      #   * +:instances+ - (Array<String>)
      #   * +:status+ - (String)
      #   * +:start_time+ - (String<ISO8601 datetime>)
      #   * +:end_time+ - (String<ISO8601 datetime>)
      #   * +:reason_codes+ - (Array<String>)
      #   * +:description+ - (String)
      # @return [Core::Response]
      define_client_method :report_instance_status, 'ReportInstanceStatus'

      # Calls the RequestSpotInstances API operation.
      # @method request_spot_instances(options = {})
      # @param [Hash] options
      #   * +:spot_price+ - *required* - (String) Specifies the maximum hourly
      #     price for any Spot Instance launched to fulfill the request.
      #   * +:instance_count+ - (Integer) Specifies the maximum number of Spot
      #     Instances to launch.
      #   * +:type+ - (String) Specifies the Spot Instance type.
      #   * +:valid_from+ - (String<ISO8601 datetime>) Defines the start date
      #     of the request. If this is a one-time request, the request becomes
      #     active at this date and time and remains active until all instances
      #     launch, the request expires, or the request is canceled. If the
      #     request is persistent, the request becomes active at this date and
      #     time and remains active until it expires or is canceled.
      #   * +:valid_until+ - (String<ISO8601 datetime>) End date of the
      #     request. If this is a one-time request, the request remains active
      #     until all instances launch, the request is canceled, or this date
      #     is reached. If the request is persistent, it remains active until
      #     it is canceled or this date and time is reached.
      #   * +:launch_group+ - (String) Specifies the instance launch group.
      #     Launch groups are Spot Instances that launch and terminate
      #     together.
      #   * +:availability_zone_group+ - (String) Specifies the Availability
      #     Zone group. When specifying the same Availability Zone group for
      #     all Spot Instance requests, all Spot Instances are launched in the
      #     same Availability Zone.
      #   * +:launch_specification+ - (Hash) Specifies additional launch
      #     instance information.
      #     * +:image_id+ - (String) The AMI ID.
      #     * +:key_name+ - (String) The name of the key pair.
      #     * +:security_groups+ - (Array<Hash>)
      #       * +:group_name+ - (String)
      #       * +:group_id+ - (String)
      #     * +:user_data+ - (String) Optional data, specific to a user's
      #       application, to provide in the launch request. All instances that
      #       collectively comprise the launch request have access to this
      #       data. User data is never returned through API responses.
      #     * +:addressing_type+ - (String) Deprecated.
      #     * +:instance_type+ - (String) Specifies the instance type.
      #     * +:placement+ - (Hash) Defines a placement item.
      #       * +:availability_zone+ - (String) The availability zone in which
      #         an Amazon EC2 instance runs.
      #       * +:group_name+ - (String) The name of the PlacementGroup in
      #         which an Amazon EC2 instance runs. Placement groups are
      #         primarily used for launching High Performance Computing
      #         instances in the same group to ensure fast connection speeds.
      #     * +:kernel_id+ - (String) Specifies the ID of the kernel to select.
      #     * +:ramdisk_id+ - (String) Specifies the ID of the RAM disk to
      #       select. Some kernels require additional drivers at launch. Check
      #       the kernel requirements for information on whether or not you
      #       need to specify a RAM disk and search for the kernel ID.
      #     * +:block_device_mappings+ - (Array<Hash>) Specifies how block
      #       devices are exposed to the instance. Each mapping is made up of a
      #       virtualName and a deviceName.
      #       * +:virtual_name+ - (String) Specifies the virtual device name.
      #       * +:device_name+ - (String) Specifies the device name (e.g.,
      #         /dev/sdh).
      #       * +:ebs+ - (Hash) Specifies parameters used to automatically
      #         setup Amazon EBS volumes when the instance is launched.
      #         * +:snapshot_id+ - (String) The ID of the snapshot from which
      #           the volume will be created.
      #         * +:volume_size+ - (Integer) The size of the volume, in
      #           gigabytes.
      #         * +:delete_on_termination+ - (Boolean) Specifies whether the
      #           Amazon EBS volume is deleted on instance termination.
      #         * +:volume_type+ - (String)
      #         * +:iops+ - (Integer)
      #       * +:no_device+ - (String) Specifies the device name to suppress
      #         during instance launch.
      #     * +:monitoring_enabled+ - (Boolean) Enables monitoring for the
      #       instance.
      #     * +:subnet_id+ - (String) Specifies the Amazon VPC subnet ID within
      #       which to launch the instance(s) for Amazon Virtual Private Cloud.
      #     * +:network_interfaces+ - (Array<Hash>)
      #       * +:network_interface_id+ - (String)
      #       * +:device_index+ - (Integer)
      #       * +:subnet_id+ - (String)
      #       * +:description+ - (String)
      #       * +:private_ip_address+ - (String)
      #       * +:groups+ - (Array<String>)
      #       * +:delete_on_termination+ - (Boolean)
      #       * +:private_ip_addresses+ - (Array<Hash>)
      #         * +:private_ip_address+ - *required* - (String)
      #         * +:primary+ - (Boolean)
      #       * +:secondary_private_ip_address_count+ - (Integer)
      #     * +:iam_instance_profile+ - (Hash)
      #       * +:arn+ - (String)
      #       * +:name+ - (String)
      #     * +:ebs_optimized+ - (Boolean)
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #   * +:spot_instance_request_set+ - (Array<Hash>)
      #     * +:valid_from+ - (Time)
      #     * +:valid_until+ - (Time)
      #     * +:launch_specification+ - (Hash)
      #       * +:group_set+ - (Array<>)
      #       * +:block_device_mapping+ - (Array<Hash>)
      #         * +:ebs+ - (Hash)
      #           * +:volume_size+ - (Integer)
      #           * +:delete_on_termination+ - (Boolean)
      #           * +:iops+ - (Integer)
      #       * +:monitoring_enabled+ - (Boolean)
      #       * +:network_interface_set+ - (Array<Hash>)
      #         * +:device_index+ - (Integer)
      #         * +:security_group_id+ - (Array<>)
      #         * +:delete_on_termination+ - (Boolean)
      #         * +:private_ip_addresses_set+ - (Array<Hash>)
      #           * +:primary+ - (Boolean)
      #         * +:secondary_private_ip_address_count+ - (Integer)
      #       * +:ebs_optimized+ - (Boolean)
      #     * +:create_time+ - (Time)
      #     * +:tag_set+ - (Array<>)
      define_client_method :request_spot_instances, 'RequestSpotInstances'

      # Calls the ResetImageAttribute API operation.
      # @method reset_image_attribute(options = {})
      # @param [Hash] options
      #   * +:image_id+ - *required* - (String) The ID of the AMI whose
      #     attribute is being reset.
      #   * +:attribute+ - *required* - (String) The name of the attribute
      #     being reset. Available attribute names: launchPermission
      # @return [Core::Response]
      define_client_method :reset_image_attribute, 'ResetImageAttribute'

      # Calls the ResetInstanceAttribute API operation.
      # @method reset_instance_attribute(options = {})
      # @param [Hash] options
      #   * +:instance_id+ - *required* - (String) The ID of the Amazon EC2
      #     instance whose attribute is being reset.
      #   * +:attribute+ - *required* - (String) The name of the attribute
      #     being reset. Available attribute names: kernel, ramdisk
      # @return [Core::Response]
      define_client_method :reset_instance_attribute, 'ResetInstanceAttribute'

      # Calls the ResetNetworkInterfaceAttribute API operation.
      # @method reset_network_interface_attribute(options = {})
      # @param [Hash] options
      #   * +:network_interface_id+ - *required* - (String)
      #   * +:source_dest_check+ - (String)
      # @return [Core::Response]
      define_client_method :reset_network_interface_attribute, 'ResetNetworkInterfaceAttribute'

      # Calls the ResetSnapshotAttribute API operation.
      # @method reset_snapshot_attribute(options = {})
      # @param [Hash] options
      #   * +:snapshot_id+ - *required* - (String) The ID of the snapshot whose
      #     attribute is being reset.
      #   * +:attribute+ - *required* - (String) The name of the attribute
      #     being reset. Available attribute names: createVolumePermission
      # @return [Core::Response]
      define_client_method :reset_snapshot_attribute, 'ResetSnapshotAttribute'

      # Calls the RevokeSecurityGroupEgress API operation.
      # @method revoke_security_group_egress(options = {})
      # @param [Hash] options
      #   * +:group_id+ - *required* - (String) ID of the VPC security group to
      #     modify.
      #   * +:source_security_group_name+ - (String) Deprecated.
      #   * +:source_security_group_owner_id+ - (String) Deprecated.
      #   * +:ip_protocol+ - (String) Deprecated.
      #   * +:from_port+ - (Integer) Deprecated.
      #   * +:to_port+ - (Integer) Deprecated.
      #   * +:cidr_ip+ - (String) Deprecated.
      #   * +:ip_permissions+ - (Array<Hash>) List of IP permissions to
      #     authorize on the specified security group. Specifying permissions
      #     through IP permissions is the preferred way of authorizing
      #     permissions since it offers more flexibility and control.
      #     * +:ip_protocol+ - (String) The IP protocol of this permission.
      #       Valid protocol values: tcp, udp, icmp
      #     * +:from_port+ - (Integer) Start of port range for the TCP and UDP
      #       protocols, or an ICMP type number. An ICMP type number of -1
      #       indicates a wildcard (i.e., any ICMP type number).
      #     * +:to_port+ - (Integer) End of port range for the TCP and UDP
      #       protocols, or an ICMP code. An ICMP code of -1 indicates a
      #       wildcard (i.e., any ICMP code).
      #     * +:user_id_group_pairs+ - (Array<Hash>) The list of AWS user IDs
      #       and groups included in this permission.
      #       * +:user_id+ - (String) The AWS user ID of an account.
      #       * +:group_name+ - (String) Name of the security group in the
      #         specified AWS account. Cannot be used when specifying a CIDR IP
      #         address range.
      #       * +:group_id+ - (String) ID of the security group in the
      #         specified AWS account. Cannot be used when specifying a CIDR IP
      #         address range.
      #     * +:ip_ranges+ - (Array<Hash>) The list of CIDR IP ranges included
      #       in this permission.
      #       * +:cidr_ip+ - (String) The list of CIDR IP ranges.
      # @return [Core::Response]
      define_client_method :revoke_security_group_egress, 'RevokeSecurityGroupEgress'

      # Calls the RevokeSecurityGroupIngress API operation.
      # @method revoke_security_group_ingress(options = {})
      # @param [Hash] options
      #   * +:group_name+ - (String) Name of the standard (EC2) security group
      #     to modify. The group must belong to your account. Can be used
      #     instead of GroupID for standard (EC2) security groups.
      #   * +:group_id+ - (String) ID of the standard (EC2) or VPC security
      #     group to modify. The group must belong to your account. Required
      #     for VPC security groups; can be used instead of GroupName for
      #     standard (EC2) security groups.
      #   * +:source_security_group_name+ - (String) Deprecated
      #   * +:source_security_group_owner_id+ - (String) Deprecated
      #   * +:ip_protocol+ - (String) Deprecated
      #   * +:from_port+ - (Integer) Deprecated
      #   * +:to_port+ - (Integer) Deprecated
      #   * +:cidr_ip+ - (String) Deprecated
      #   * +:ip_permissions+ - (Array<Hash>) List of IP permissions to revoke
      #     on the specified security group. For an IP permission to be
      #     removed, it must exactly match one of the IP permissions you
      #     specify in this list. Specifying permissions through IP permissions
      #     is the preferred way of revoking permissions since it offers more
      #     flexibility and control.
      #     * +:ip_protocol+ - (String) The IP protocol of this permission.
      #       Valid protocol values: tcp, udp, icmp
      #     * +:from_port+ - (Integer) Start of port range for the TCP and UDP
      #       protocols, or an ICMP type number. An ICMP type number of -1
      #       indicates a wildcard (i.e., any ICMP type number).
      #     * +:to_port+ - (Integer) End of port range for the TCP and UDP
      #       protocols, or an ICMP code. An ICMP code of -1 indicates a
      #       wildcard (i.e., any ICMP code).
      #     * +:user_id_group_pairs+ - (Array<Hash>) The list of AWS user IDs
      #       and groups included in this permission.
      #       * +:user_id+ - (String) The AWS user ID of an account.
      #       * +:group_name+ - (String) Name of the security group in the
      #         specified AWS account. Cannot be used when specifying a CIDR IP
      #         address range.
      #       * +:group_id+ - (String) ID of the security group in the
      #         specified AWS account. Cannot be used when specifying a CIDR IP
      #         address range.
      #     * +:ip_ranges+ - (Array<Hash>) The list of CIDR IP ranges included
      #       in this permission.
      #       * +:cidr_ip+ - (String) The list of CIDR IP ranges.
      # @return [Core::Response]
      define_client_method :revoke_security_group_ingress, 'RevokeSecurityGroupIngress'

      # Calls the RunInstances API operation.
      # @method run_instances(options = {})
      # @param [Hash] options
      #   * +:image_id+ - *required* - (String) Unique ID of a machine image,
      #     returned by a call to DescribeImages.
      #   * +:min_count+ - *required* - (Integer) Minimum number of instances
      #     to launch. If the value is more than Amazon EC2 can launch, no
      #     instances are launched at all.
      #   * +:max_count+ - *required* - (Integer) Maximum number of instances
      #     to launch. If the value is more than Amazon EC2 can launch, the
      #     largest possible number above minCount will be launched instead.
      #     Between 1 and the maximum number allowed for your account (default:
      #     20).
      #   * +:key_name+ - (String) The name of the key pair.
      #   * +:security_groups+ - (Array<String>) The names of the security
      #     groups into which the instances will be launched.
      #   * +:security_group_ids+ - (Array<String>)
      #   * +:user_data+ - (String) Specifies additional information to make
      #     available to the instance(s).
      #   * +:addressing_type+ - (String)
      #   * +:instance_type+ - (String) Specifies the instance type for the
      #     launched instances.
      #   * +:placement+ - (Hash) Specifies the placement constraints
      #     (Availability Zones) for launching the instances.
      #     * +:availability_zone+ - (String) The availability zone in which an
      #       Amazon EC2 instance runs.
      #     * +:group_name+ - (String) The name of the PlacementGroup in which
      #       an Amazon EC2 instance runs. Placement groups are primarily used
      #       for launching High Performance Computing instances in the same
      #       group to ensure fast connection speeds.
      #     * +:tenancy+ - (String) The allowed tenancy of instances launched
      #       into the VPC. A value of default means instances can be launched
      #       with any tenancy; a value of dedicated means all instances
      #       launched into the VPC will be launched as dedicated tenancy
      #       regardless of the tenancy assigned to the instance at launch.
      #   * +:kernel_id+ - (String) The ID of the kernel with which to launch
      #     the instance.
      #   * +:ramdisk_id+ - (String) The ID of the RAM disk with which to
      #     launch the instance. Some kernels require additional drivers at
      #     launch. Check the kernel requirements for information on whether
      #     you need to specify a RAM disk. To find kernel requirements, go to
      #     the Resource Center and search for the kernel ID.
      #   * +:block_device_mappings+ - (Array<Hash>) Specifies how block
      #     devices are exposed to the instance. Each mapping is made up of a
      #     virtualName and a deviceName.
      #     * +:virtual_name+ - (String) Specifies the virtual device name.
      #     * +:device_name+ - (String) Specifies the device name (e.g.,
      #       /dev/sdh).
      #     * +:ebs+ - (Hash) Specifies parameters used to automatically setup
      #       Amazon EBS volumes when the instance is launched.
      #       * +:snapshot_id+ - (String) The ID of the snapshot from which the
      #         volume will be created.
      #       * +:volume_size+ - (Integer) The size of the volume, in
      #         gigabytes.
      #       * +:delete_on_termination+ - (Boolean) Specifies whether the
      #         Amazon EBS volume is deleted on instance termination.
      #       * +:volume_type+ - (String)
      #       * +:iops+ - (Integer)
      #     * +:no_device+ - (String) Specifies the device name to suppress
      #       during instance launch.
      #   * +:monitoring+ - (Hash) Enables monitoring for the instance.
      #     * +:enabled+ - *required* - (Boolean)
      #   * +:subnet_id+ - (String) Specifies the subnet ID within which to
      #     launch the instance(s) for Amazon Virtual Private Cloud.
      #   * +:disable_api_termination+ - (Boolean) Specifies whether the
      #     instance can be terminated using the APIs. You must modify this
      #     attribute before you can terminate any "locked" instances from the
      #     APIs.
      #   * +:instance_initiated_shutdown_behavior+ - (String) Specifies
      #     whether the instance's Amazon EBS volumes are stopped or terminated
      #     when the instance is shut down.
      #   * +:license+ - (Hash) Specifies active licenses in use and attached
      #     to an Amazon EC2 instance.
      #     * +:pool+ - (String) The license pool from which to take a license
      #       when starting Amazon EC2 instances in the associated RunInstances
      #       request.
      #   * +:private_ip_address+ - (String) If you're using Amazon Virtual
      #     Private Cloud, you can optionally use this parameter to assign the
      #     instance a specific available IP address from the subnet.
      #   * +:client_token+ - (String) Unique, case-sensitive identifier you
      #     provide to ensure idempotency of the request. For more information,
      #     go to How to Ensure Idempotency in the Amazon Elastic Compute Cloud
      #     User Guide.
      #   * +:additional_info+ - (String)
      #   * +:network_interfaces+ - (Array<Hash>)
      #     * +:network_interface_id+ - (String)
      #     * +:device_index+ - (Integer)
      #     * +:subnet_id+ - (String)
      #     * +:description+ - (String)
      #     * +:private_ip_address+ - (String)
      #     * +:groups+ - (Array<String>)
      #     * +:delete_on_termination+ - (Boolean)
      #     * +:private_ip_addresses+ - (Array<Hash>)
      #       * +:private_ip_address+ - *required* - (String)
      #       * +:primary+ - (Boolean)
      #     * +:secondary_private_ip_address_count+ - (Integer)
      #   * +:iam_instance_profile+ - (Hash)
      #     * +:arn+ - (String)
      #     * +:name+ - (String)
      #   * +:ebs_optimized+ - (Boolean)
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #   * +:group_set+ - (Array<>)
      #   * +:instances_set+ - (Array<Hash>)
      #     * +:instance_state+ - (Hash)
      #       * +:code+ - (Integer)
      #     * +:ami_launch_index+ - (Integer)
      #     * +:product_codes+ - (Array<>)
      #     * +:launch_time+ - (Time)
      #     * +:block_device_mapping+ - (Array<Hash>)
      #       * +:ebs+ - (Hash)
      #         * +:attach_time+ - (Time)
      #         * +:delete_on_termination+ - (Boolean)
      #     * +:tag_set+ - (Array<>)
      #     * +:group_set+ - (Array<>)
      #     * +:source_dest_check+ - (Boolean)
      #     * +:network_interface_set+ - (Array<Hash>)
      #       * +:source_dest_check+ - (Boolean)
      #       * +:group_set+ - (Array<>)
      #       * +:attachment+ - (Hash)
      #         * +:device_index+ - (Integer)
      #         * +:attach_time+ - (Time)
      #         * +:delete_on_termination+ - (Boolean)
      #     * +:ebs_optimized+ - (Boolean)
      define_client_method :run_instances, 'RunInstances'

      # Calls the StartInstances API operation.
      # @method start_instances(options = {})
      # @param [Hash] options
      #   * +:instance_ids+ - *required* - (Array<String>) The list of Amazon
      #     EC2 instances to start.
      #   * +:additional_info+ - (String)
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #   * +:instances_set+ - (Array<Hash>)
      #     * +:current_state+ - (Hash)
      #       * +:code+ - (Integer)
      #     * +:previous_state+ - (Hash)
      #       * +:code+ - (Integer)
      define_client_method :start_instances, 'StartInstances'

      # Calls the StopInstances API operation.
      # @method stop_instances(options = {})
      # @param [Hash] options
      #   * +:instance_ids+ - *required* - (Array<String>) The list of Amazon
      #     EC2 instances to stop.
      #   * +:force+ - (Boolean) Forces the instance to stop. The instance will
      #     not have an opportunity to flush file system caches nor file system
      #     meta data. If you use this option, you must perform file system
      #     check and repair procedures. This option is not recommended for
      #     Windows instances.
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #   * +:instances_set+ - (Array<Hash>)
      #     * +:current_state+ - (Hash)
      #       * +:code+ - (Integer)
      #     * +:previous_state+ - (Hash)
      #       * +:code+ - (Integer)
      define_client_method :stop_instances, 'StopInstances'

      # Calls the TerminateInstances API operation.
      # @method terminate_instances(options = {})
      # @param [Hash] options
      #   * +:instance_ids+ - *required* - (Array<String>) The list of
      #     instances to terminate.
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #   * +:instances_set+ - (Array<Hash>)
      #     * +:current_state+ - (Hash)
      #       * +:code+ - (Integer)
      #     * +:previous_state+ - (Hash)
      #       * +:code+ - (Integer)
      define_client_method :terminate_instances, 'TerminateInstances'

      # Calls the UnassignPrivateIpAddresses API operation.
      # @method unassign_private_ip_addresses(options = {})
      # @param [Hash] options
      #   * +:network_interface_id+ - *required* - (String)
      #   * +:private_ip_addresses+ - *required* - (Array<String>)
      # @return [Core::Response]
      define_client_method :unassign_private_ip_addresses, 'UnassignPrivateIpAddresses'

      # Calls the UnmonitorInstances API operation.
      # @method unmonitor_instances(options = {})
      # @param [Hash] options
      #   * +:instance_ids+ - *required* - (Array<String>) The list of Amazon
      #     EC2 instances on which to disable monitoring.
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #   * +:instances_set+ - (Array<>)
      define_client_method :unmonitor_instances, 'UnmonitorInstances'

      ## end client methods ##

    end
  end
end
