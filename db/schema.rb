# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_08_234600) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cloud_management_systems", force: :cascade do |t|
    t.string "name"
    t.integer "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ha_models", force: :cascade do |t|
    t.string "name"
    t.integer "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "hourly_costs", force: :cascade do |t|
    t.integer "lead_architect"
    t.integer "design_engineer"
    t.integer "network_integration"
    t.integer "technical_project_manager"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "migrations", force: :cascade do |t|
    t.string "name"
    t.integer "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "nuage_versions", force: :cascade do |t|
    t.string "name"
    t.integer "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "qty_ranges", force: :cascade do |t|
    t.string "name"
    t.integer "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "quotes", force: :cascade do |t|
    t.string "account_name"
    t.integer "quote_owner"
    t.string "account_contact"
    t.string "presales_engineer"
    t.string "bdm_engineer"
    t.string "project_manager"
    t.string "customer_name"
    t.string "customer_phone"
    t.string "customer_email"
    t.string "customer_position"
    t.text "comments"
    t.string "salesforce_operation"
    t.string "wbs"
    t.string "po"
    t.integer "vertical"
    t.integer "cluster"
    t.integer "revenue"
    t.integer "version_to_install"
    t.integer "datacenters", default: 0
    t.integer "ha_model"
    t.integer "nsgc"
    t.integer "nsge"
    t.integer "nsgx"
    t.integer "dual_uplink"
    t.integer "internet_breakout"
    t.integer "pat_nat"
    t.integer "ipsec"
    t.integer "dhcp"
    t.integer "l3l4_firewall"
    t.integer "port_statistics"
    t.integer "notification_app"
    t.integer "vns_portal"
    t.integer "bgp_ospf"
    t.integer "redundant_cpes"
    t.integer "managed_wifi"
    t.integer "managed_lte"
    t.integer "qos"
    t.integer "l7_acls"
    t.integer "network_performance_visibility"
    t.integer "application_visibility_routing"
    t.integer "service_chaining"
    t.integer "public_cloud_conectivity"
    t.integer "ipv6"
    t.integer "saas_breakout"
    t.integer "branch_hosted_vnfs"
    t.integer "automated_security_service_insertion"
    t.integer "conext_aware_security_analytics"
    t.integer "independent_vsd_cluster"
    t.integer "vrsk"
    t.integer "vrsh"
    t.integer "vrsv"
    t.integer "telco_cloud"
    t.integer "cms1"
    t.integer "cms2"
    t.integer "cms3"
    t.integer "openshift"
    t.integer "containers"
    t.integer "wbx_210"
    t.integer "nokia_7750"
    t.integer "ale_switches"
    t.integer "traffic_steering"
    t.integer "advanced_policies"
    t.integer "reporting"
    t.integer "multiple_domains"
    t.integer "dpdk"
    t.integer "sriov"
    t.integer "datacenter_switches"
    t.integer "firewalls"
    t.integer "load_balancers"
    t.integer "syslog_server"
    t.integer "bgp_peering"
    t.integer "api_integration"
    t.integer "nokia_7750_router_integration"
    t.integer "migration"
    t.integer "include_sdn"
    t.integer "include_sdwan"
    t.integer "weeks_national_travel", default: 0
    t.integer "weeks_international_travel", default: 0
    t.integer "current_version"
    t.integer "risk_order"
    t.decimal "complexity_coeficient"
    t.decimal "design_services_total"
    t.decimal "install_services_total"
    t.decimal "travel_expenses_total"
    t.decimal "total_cost"
    t.integer "national_travel"
    t.integer "international_travel"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_quotes_on_user_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.integer "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "revenues", force: :cascade do |t|
    t.string "name"
    t.integer "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "verticals", force: :cascade do |t|
    t.string "name"
    t.integer "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "quotes", "users"
end
