# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

HourlyCost.create(lead_architect: 80, design_engineer: 65, network_integration: 55, technical_project_manager: 55)

NuageVersion.create(name: "None", value: 0)
NuageVersion.create(name: "3.X.X", value: 4)
NuageVersion.create(name: "4.X.X", value: 3)
NuageVersion.create(name: "5.X.X", value: 2)
NuageVersion.create(name: "6.X.X", value: 2)
NuageVersion.create(name: "Latest stable", value: 1)
NuageVersion.create(name: "Latest beta - Special features required", value: 0)

HaModel.create(name: "None", value: 0)
HaModel.create(name: "Disaster Recovery", value: 2)
HaModel.create(name: "Geographycal redundancy", value: 3)

Vertical.create(name: "None", value: 0)
Vertical.create(name: "Enterprise", value: 1)
Vertical.create(name: "Government", value: 2)
Vertical.create(name: "Telco and/or Service Provider", value: 3)

QtyRange.create(name: "None", value: 0)
QtyRange.create(name: "1 to 5", value: 1)
QtyRange.create(name: "5 to 10", value: 2)
QtyRange.create(name: "10 to 25", value: 3)
QtyRange.create(name: "25 to 50", value: 4)
QtyRange.create(name: "50 to 100", value: 5)
QtyRange.create(name: "100 to 250", value: 6)
QtyRange.create(name: "250 to 500", value: 7)
QtyRange.create(name: "500 to 1000", value: 8)
QtyRange.create(name: "1000 to 2000", value: 9)
QtyRange.create(name: "2000 to 5000", value: 10)
QtyRange.create(name: "5000 or more", value: 11)

Revenue.create(name: "None", value: 0)
Revenue.create(name: "0K - 100K", value: 1)
Revenue.create(name: "100K - 250K", value: 3)
Revenue.create(name: "250K - 500K", value: 6)
Revenue.create(name: "1M - 2M", value: 9)
Revenue.create(name: "2M - 5M", value: 12)
Revenue.create(name: "5M - 10M", value: 15)
Revenue.create(name: "10M >", value: 20)

Region.create(name: "None", value: 0)
Region.create(name: "TIER 1 - Mexico & Brazil", value: 1)
Region.create(name: "TIER 2 - Southern Cone", value: 2)
Region.create(name: "TIER 3 - Andinos", value: 3)
Region.create(name: "TIER 4 - Central America & The Caribean", value: 4)
Region.create(name: "TIER 5 - Other (US, Europe, Emea)", value: 5)

CloudManagementSystem.create(name: "None", value: 0)
CloudManagementSystem.create(name: "Openstack", value: 1)
CloudManagementSystem.create(name: "Microsoft System Center ", value: 3)
CloudManagementSystem.create(name: "VMware Vcenter", value: 2)
CloudManagementSystem.create(name: "Nokia Cloud Band", value: 4)
CloudManagementSystem.create(name: "Other", value: 5)