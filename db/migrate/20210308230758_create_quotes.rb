class CreateQuotes < ActiveRecord::Migration[6.1]
  def change
    create_table :quotes do |t|
      t.string :account_name
      t.string :quote_owner

      t.string :account_contact
      t.string :presales_engineer
      t.string :bdm_engineer
      t.string :project_manager

      t.string :customer_name
      t.string :customer_phone
      t.string :customer_email
      t.string :customer_position
      t.text :comments

      t.string :salesforce_operation
      t.string :wbs
      t.string :po
      # Business
      t.integer :vertical
      t.integer :cluster
      t.integer :revenue
      # VSP - Nuage Base
      t.integer :version_to_install
      t.integer :datacenters, default: 0
      t.integer :ha_model
      # VNS - Nuage SDWAN CPEs
      t.integer :nsgc
      t.integer :nsge
      t.integer :nsgx
      # VNS - Standard Features
      t.integer :dual_uplink
      t.integer :internet_breakout
      t.integer :pat_nat
      t.integer :ipsec
      t.integer :dhcp
      t.integer :l3l4_firewall
      t.integer :port_statistics
      t.integer :notification_app
      t.integer :vns_portal
      # VNS - Advanced Features
      t.integer :bgp_ospf
      t.integer :redundant_cpes
      t.integer :managed_wifi
      t.integer :managed_lte
      t.integer :qos
      t.integer :l7_acls
      t.integer :network_performance_visibility
      t.integer :application_visibility_routing
      t.integer :service_chaining
      # VNS - Enhanced Features
      t.integer :public_cloud_conectivity
      t.integer :ipv6
      t.integer :saas_breakout
      t.integer :branch_hosted_vnfs
      t.integer :automated_security_service_insertion
      t.integer :conext_aware_security_analytics
      # VSC - Nuage SDN
      t.integer :independent_vsd_cluster
      t.integer :vrsk
      t.integer :vrsh
      t.integer :vrsv
      # VSC - Orchestration Layer
      t.integer :telco_cloud
      t.integer :cms1
      t.integer :cms2
      t.integer :cms3
      t.integer :openshift
      t.integer :containers
      # VSC - Nokia Datacenter Hardware
      t.integer :wbx_210
      t.integer :nokia_7750
      t.integer :ale_switches
      # VSC - Advanced Features
      t.integer :traffic_steering
      t.integer :advanced_policies
      t.integer :reporting
      t.integer :multiple_domains
      t.integer :dpdk
      t.integer :sriov
      # VSC - Advanced Integrations
      t.integer :datacenter_switches
      t.integer :firewalls
      t.integer :load_balancers
      t.integer :syslog_server
      t.integer :bgp_peering
      t.integer :api_integration
      t.integer :nokia_7750_router_integration
      # Others
      t.integer :migration
      t.integer :include_sdn
      t.integer :include_sdwan
      t.integer :weeks_national_travel, default: 0
      t.integer :weeks_international_travel, default: 0
      t.integer :current_version
      t.integer :risk_order
      # Results
      t.decimal :complexity_coeficient
      t.decimal :design_services_total
      t.decimal :install_services_total
      t.decimal :travel_expenses_total
      t.decimal :total_cost
      # Const
      # Travel and Expenses
      t.integer :national_travel
      t.integer :international_travel

      t.timestamps
    end
  end
end
