class QuotesController < ApplicationController
  before_action :set_quote, except: %i[ new create index ]
  before_action :get_selects_info, only: %i[ new edit show ]
  before_action :calculate_quote, only: %i[ create update ]
  before_action :authenticate_user!

  # GET /quotes or /quotes.json
  def index
    @quotes = Quote.all
  end

  # GET /quotes/1 or /quotes/1.json
  def show
    respond_to do |format|
      format.html
      # STILL MISSING THIN_GS
      format.pdf do
        pdf = render_to_string pdf: "Quote_#{@quote.id}_#{@quote.account_name}_#{@quote.created_at}",
                               page_size: 'Letter',
                               template: "pdf/quote.html.erb",
                               layout: "pdf.html",
                               margin: { top: 30, bottom: 25.4, left: 23, right: 20 },
                               header: { right: "#{localize(@quote.created_at, :format => :long)}", font_size: 10 },
                               footer: { center: "Page [page] of [topage]", font_size: 10 }
        # Donwload PDF
        send_data pdf, :filename => "Quote_#{@quote.id}_#{@quote.account_name}_#{@quote.created_at}.pdf"

        # Send Email to current user
        QuotingMailer.send_pdf(current_user, @quote, pdf).deliver
      end
    end
  end

  # GET /quotes/new
  def new
    @quote = Quote.new
    @quote.quote_owner = current_user.email
  end

  # GET /quotes/1/edit
  def edit
  end

  # POST /quotes or /quotes.json
  def create
    @quote = Quote.new(
      id: params[:quote][:id],
      account_name: params[:quote][:account_name],
      quote_owner: params[:quote][:quote_owner],
      account_contact: params[:quote][:account_contact],
      presales_engineer: params[:quote][:presales_engineer],
      bdm_engineer: params[:quote][:bdm_engineer],
      project_manager: params[:quote][:project_manager],
      customer_name: params[:quote][:customer_name],
      customer_phone: params[:quote][:customer_phone],
      customer_email: params[:quote][:customer_email],
      customer_position: params[:quote][:customer_position],
      comments: params[:quote][:comments],
      salesforce_operation: params[:quote][:salesforce_operation],
      wbs: params[:quote][:wbs],
      po: params[:quote][:po],
      vertical: params[:quote][:vertical],
      cluster: params[:quote][:cluster],
      revenue: params[:quote][:revenue],
      version_to_install: params[:quote][:version_to_install],
      datacenters: params[:quote][:datacenters],
      ha_model: params[:quote][:ha_model],
      nsgc: params[:quote][:nsgc],
      nsge: params[:quote][:nsge],
      nsgx: params[:quote][:nsgx],
      dual_uplink: params[:quote][:dual_uplink],
      internet_breakout: params[:quote][:internet_breakout],
      pat_nat: params[:quote][:pat_nat],
      ipsec: params[:quote][:ipsec],
      dhcp: params[:quote][:dhcp],
      l3l4_firewall: params[:quote][:l3l4_firewall],
      port_statistics: params[:quote][:port_statistics],
      notification_app: params[:quote][:notification_app],
      vns_portal: params[:quote][:vns_portal],
      bgp_ospf: params[:quote][:bgp_ospf],
      redundant_cpes: params[:quote][:redundant_cpes],
      managed_wifi: params[:quote][:managed_wifi],
      managed_lte: params[:quote][:managed_lte],
      qos: params[:quote][:qos],
      l7_acls: params[:quote][:l7_acls],
      network_performance_visibility: params[:quote][:network_performance_visibility],
      application_visibility_routing: params[:quote][:application_visibility_routing],
      service_chaining: params[:quote][:service_chaining],
      public_cloud_conectivity: params[:quote][:public_cloud_conectivity],
      ipv6: params[:quote][:ipv6],
      saas_breakout: params[:quote][:saas_breakout],
      branch_hosted_vnfs: params[:quote][:branch_hosted_vnfs],
      automated_security_service_insertion: params[:quote][:automated_security_service_insertion],
      conext_aware_security_analytics: params[:quote][:conext_aware_security_analytics],
      independent_vsd_cluster: params[:quote][:independent_vsd_cluster],
      vrsk: params[:quote][:vrsk],
      vrsh: params[:quote][:vrsh],
      vrsv: params[:quote][:vrsv],
      telco_cloud: params[:quote][:telco_cloud],
      cms1: params[:quote][:cms1],
      cms2: params[:quote][:cms2],
      cms3: params[:quote][:cms3],
      openshift: params[:quote][:openshift],
      containers: params[:quote][:containers],
      wbx_210: params[:quote][:wbx_210],
      nokia_7750: params[:quote][:nokia_7750],
      ale_switches: params[:quote][:ale_switches],
      traffic_steering: params[:quote][:traffic_steering],
      advanced_policies: params[:quote][:advanced_policies],
      reporting: params[:quote][:reporting],
      multiple_domains: params[:quote][:multiple_domains],
      dpdk: params[:quote][:dpdk],
      sriov: params[:quote][:sriov],
      datacenter_switches: params[:quote][:datacenter_switches],
      firewalls: params[:quote][:firewalls],
      load_balancers: params[:quote][:load_balancers],
      syslog_server: params[:quote][:syslog_server],
      bgp_peering: params[:quote][:bgp_peering],
      api_integration: params[:quote][:api_integration],
      nokia_7750_router_integration: params[:quote][:nokia_7750_router_integration],
      migration: params[:quote][:migration],
      include_sdn: params[:quote][:include_sdn],
      include_sdwan: params[:quote][:include_sdwan],
      weeks_national_travel: params[:quote][:weeks_national_travel],
      weeks_international_travel: params[:quote][:weeks_international_travel],
      current_version: params[:quote][:current_version],
      complexity_coeficient: params[:quote][:complexity_coeficient],
      design_services_total: params[:quote][:design_services_total],
      install_services_total: params[:quote][:install_services_total],
      travel_expenses_total: params[:quote][:travel_expenses_total],
      total_cost: params[:quote][:total_cost],
      national_travel: params[:quote][:national_travel],
      international_travel: params[:quote][:international_travel],
      risk_order: params[:quote][:risk_order],
      user: current_user
    )

    respond_to do |format|
      if @quote.save
        format.html { redirect_to @quote, notice: "Quote was successfully created." }
        format.json { render :show, status: :created, location: @quote }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quotes/1 or /quotes/1.json
  def update
    respond_to do |format|
      if @quote.update(
        account_name: params[:quote][:account_name],
        quote_owner: params[:quote][:quote_owner],
        account_contact: params[:quote][:account_contact],
        presales_engineer: params[:quote][:presales_engineer],
        bdm_engineer: params[:quote][:bdm_engineer],
        project_manager: params[:quote][:project_manager],
        customer_name: params[:quote][:customer_name],
        customer_phone: params[:quote][:customer_phone],
        customer_email: params[:quote][:customer_email],
        customer_position: params[:quote][:customer_position],
        comments: params[:quote][:comments],
        salesforce_operation: params[:quote][:salesforce_operation],
        wbs: params[:quote][:wbs],
        po: params[:quote][:po],
        vertical: params[:quote][:vertical],
        cluster: params[:quote][:cluster],
        revenue: params[:quote][:revenue],
        version_to_install: params[:quote][:version_to_install],
        datacenters: params[:quote][:datacenters],
        ha_model: params[:quote][:ha_model],
        nsgc: params[:quote][:nsgc],
        nsge: params[:quote][:nsge],
        nsgx: params[:quote][:nsgx],
        dual_uplink: params[:quote][:dual_uplink],
        internet_breakout: params[:quote][:internet_breakout],
        pat_nat: params[:quote][:pat_nat],
        ipsec: params[:quote][:ipsec],
        dhcp: params[:quote][:dhcp],
        l3l4_firewall: params[:quote][:l3l4_firewall],
        port_statistics: params[:quote][:port_statistics],
        notification_app: params[:quote][:notification_app],
        vns_portal: params[:quote][:vns_portal],
        bgp_ospf: params[:quote][:bgp_ospf],
        redundant_cpes: params[:quote][:redundant_cpes],
        managed_wifi: params[:quote][:managed_wifi],
        managed_lte: params[:quote][:managed_lte],
        qos: params[:quote][:qos],
        l7_acls: params[:quote][:l7_acls],
        network_performance_visibility: params[:quote][:network_performance_visibility],
        application_visibility_routing: params[:quote][:application_visibility_routing],
        service_chaining: params[:quote][:service_chaining],
        public_cloud_conectivity: params[:quote][:public_cloud_conectivity],
        ipv6: params[:quote][:ipv6],
        saas_breakout: params[:quote][:saas_breakout],
        branch_hosted_vnfs: params[:quote][:branch_hosted_vnfs],
        automated_security_service_insertion: params[:quote][:automated_security_service_insertion],
        conext_aware_security_analytics: params[:quote][:conext_aware_security_analytics],
        independent_vsd_cluster: params[:quote][:independent_vsd_cluster],
        vrsk: params[:quote][:vrsk],
        vrsh: params[:quote][:vrsh],
        vrsv: params[:quote][:vrsv],
        telco_cloud: params[:quote][:telco_cloud],
        cms1: params[:quote][:cms1],
        cms2: params[:quote][:cms2],
        cms3: params[:quote][:cms3],
        openshift: params[:quote][:openshift],
        containers: params[:quote][:containers],
        wbx_210: params[:quote][:wbx_210],
        nokia_7750: params[:quote][:nokia_7750],
        ale_switches: params[:quote][:ale_switches],
        traffic_steering: params[:quote][:traffic_steering],
        advanced_policies: params[:quote][:advanced_policies],
        reporting: params[:quote][:reporting],
        multiple_domains: params[:quote][:multiple_domains],
        dpdk: params[:quote][:dpdk],
        sriov: params[:quote][:sriov],
        datacenter_switches: params[:quote][:datacenter_switches],
        firewalls: params[:quote][:firewalls],
        load_balancers: params[:quote][:load_balancers],
        syslog_server: params[:quote][:syslog_server],
        bgp_peering: params[:quote][:bgp_peering],
        api_integration: params[:quote][:api_integration],
        nokia_7750_router_integration: params[:quote][:nokia_7750_router_integration],
        migration: params[:quote][:migration],
        include_sdn: params[:quote][:include_sdn],
        include_sdwan: params[:quote][:include_sdwan],
        weeks_national_travel: params[:quote][:weeks_national_travel],
        weeks_international_travel: params[:quote][:weeks_international_travel],
        current_version: params[:quote][:current_version],
        complexity_coeficient: params[:quote][:complexity_coeficient],
        design_services_total: params[:quote][:design_services_total],
        install_services_total: params[:quote][:install_services_total],
        travel_expenses_total: params[:quote][:travel_expenses_total],
        total_cost: params[:quote][:total_cost],
        national_travel: params[:quote][:national_travel],
        international_travel: params[:quote][:international_travel],
        risk_order: params[:quote][:risk_order]
      )
        format.html { redirect_to @quote, notice: "Quote was successfully updated." }
        format.json { render :show, status: :ok, location: @quote }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quotes/1 or /quotes/1.json
  def destroy
    @quote.destroy
    respond_to do |format|
      format.html { redirect_to quotes_url, notice: "Quote was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def calculate_quote
    # Business
    vertical = [1, params[:quote][:vertical].to_i]
    cluster = [1, params[:quote][:cluster].to_i]
    revenue = [1, params[:quote][:revenue].to_i]
    # VSP - Nuage Base
    vti = NuageVersion.find(params[:quote][:version_to_install].to_i)

    version_to_install = [1, vti.value]
    datacenters = [3, params[:quote][:datacenters].to_i]
    ha_model = [1, params[:quote][:ha_model].to_i]
    # VNS - Nuage SDWAN CPEs
    nsgc = [1, params[:quote][:nsgc].to_i]
    nsge = [1, params[:quote][:nsge].to_i]
    nsgx = [3, params[:quote][:nsgx].to_i]
    # VNS - Standard Features
    dual_uplink = [2, params[:quote][:dual_uplink].to_i]
    internet_breakout = [1, params[:quote][:internet_breakout].to_i]
    pat_nat = [1, params[:quote][:pat_nat].to_i]
    ipsec = [1, params[:quote][:ipsec].to_i]
    dhcp = [1, params[:quote][:dhcp].to_i]
    l3l4_firewall = [2, params[:quote][:l3l4_firewall].to_i]
    port_statistics = [2, params[:quote][:port_statistics].to_i]
    notification_app = [2, params[:quote][:notification_app].to_i]
    vns_portal = [2, params[:quote][:vns_portal].to_i]
    # VNS - Advanced Features
    bgp_ospf = [4, params[:quote][:bgp_ospf].to_i]
    redundant_cpes = [2, params[:quote][:redundant_cpes].to_i]
    managed_wifi = [2, params[:quote][:managed_wifi].to_i]
    managed_lte = [2, params[:quote][:managed_lte].to_i]
    qos = [4, params[:quote][:qos].to_i]
    l7_acls = [4, params[:quote][:l7_acls].to_i]
    network_performance_visibility = [3, params[:quote][:network_performance_visibility].to_i]
    application_visibility_routing = [4, params[:quote][:application_visibility_routing].to_i]
    service_chaining = [3, params[:quote][:service_chaining].to_i]
    # VNS - Enhanced Features
    public_cloud_conectivity = [5, params[:quote][:public_cloud_conectivity].to_i]
    ipv6 = [5, params[:quote][:ipv6].to_i]
    saas_breakout = [5, params[:quote][:saas_breakout].to_i]
    branch_hosted_vnfs = [5, params[:quote][:branch_hosted_vnfs].to_i]
    automated_security_service_insertion = [5, params[:quote][:automated_security_service_insertion].to_i]
    conext_aware_security_analytics = [5, params[:quote][:conext_aware_security_analytics].to_i]
    # VSC - Nuage SDN
    independent_vsd_cluster = [5, params[:quote][:independent_vsd_cluster].to_i]
    vrsk = [1, params[:quote][:vrsk].to_i]
    vrsh = [3, params[:quote][:vrsh].to_i]
    vrsv = [2, params[:quote][:vrsv].to_i]
    # VSC - Orchestration Layer
    telco_cloud = [15, params[:quote][:telco_cloud].to_i]
    cms1 = [5, params[:quote][:cms1].to_i]
    cms2 = [5, params[:quote][:cms2].to_i]
    cms3 = [5, params[:quote][:cms3].to_i]
    openshift = [5, params[:quote][:openshift].to_i]
    containers = [5, params[:quote][:containers].to_i]
    # VSC - Nokia Datacenter Hardware
    wbx_210 = [3, params[:quote][:wbx_210].to_i]
    nokia_7750 = [5, params[:quote][:nokia_7750].to_i]
    ale_switches = [5, params[:quote][:ale_switches].to_i]
    # VSC - Advanced Features
    traffic_steering = [5, params[:quote][:traffic_steering].to_i]
    advanced_policies = [5, params[:quote][:advanced_policies].to_i]
    reporting = [5, params[:quote][:reporting].to_i]
    multiple_domains = [5, params[:quote][:multiple_domains].to_i]
    dpdk = [10, params[:quote][:dpdk].to_i]
    sriov = [10, params[:quote][:sriov].to_i]
    # VSC - Advanced Integrations
    datacenter_switches = [5, params[:quote][:datacenter_switches].to_i]
    firewalls = [5, params[:quote][:firewalls].to_i]
    load_balancers = [5, params[:quote][:load_balancers].to_i]
    syslog_server = [3, params[:quote][:syslog_server].to_i]
    bgp_peering = [5, params[:quote][:bgp_peering].to_i]
    api_integration = [10, params[:quote][:api_integration].to_i]
    nokia_7750_router_integration = [5, params[:quote][:nokia_7750_router_integration].to_i]
    # Others
    migration = params[:quote][:migration].to_i
    include_sdn = params[:quote][:include_sdn].to_i
    include_sdwan = params[:quote][:include_sdwan].to_i
    weeks_national_travel = params[:quote][:weeks_national_travel].to_i
    weeks_international_travel = params[:quote][:weeks_international_travel].to_i
    # Results
    design_services_total = 0
    install_services_total = 0
    travel_expenses_total = 0
    total_cost = 0
    # Const
    # Travel and Expenses
    national_travel = 1200
    international_travel = 2500

    # Hourly Cost
    hourly_costs = HourlyCost.last

    la_cost = hourly_costs.lead_architect
    di_cost = hourly_costs.design_engineer
    ni_cost = hourly_costs.network_integration
    tpm_cost = hourly_costs.technical_project_manager

    business_total = (((vertical[0]*vertical[1]) + (cluster[0]*cluster[1]) + (revenue[0]*revenue[1]))/3.to_f).round(1)
    nuage_base_total = (((version_to_install[0]*version_to_install[1]) + (datacenters[0]*datacenters[1]) + (ha_model[0]*ha_model[1]))/3.to_f).round(1)
    nuage_sdwan_total = (((nsgc[0]*nsgc[1]) + (nsge[0]*nsge[1]) + (nsgx[0]*nsgx[1]))/3.to_f).round(1)
    vns_standard_total = (((dual_uplink[0]*dual_uplink[1]) + (internet_breakout[0]*internet_breakout[1]) + (pat_nat[0]*pat_nat[1]) + (ipsec[0]*ipsec[1]) + (dhcp[0]*dhcp[1]) + (l3l4_firewall[0]*l3l4_firewall[1]) + (port_statistics[0]*port_statistics[1]) +(notification_app[0]*notification_app[1]) + (vns_portal[0]*vns_portal[1]))/9.to_f).round(1)
    vns_advanced_total = (((bgp_ospf[0]*bgp_ospf[1]) + (redundant_cpes[0]*redundant_cpes[1]) + (managed_wifi[0]*managed_wifi[1]) + (managed_lte[0]*managed_lte[1]) + (qos[0]*qos[1]) + (l7_acls[0]*l7_acls[1]) + (network_performance_visibility[0]*network_performance_visibility[1]) +(application_visibility_routing[0]*application_visibility_routing[1]) + (service_chaining[0]*service_chaining[1]))/9.to_f).round(1)
    vns_enhanced_total = (((public_cloud_conectivity[0]*public_cloud_conectivity[1]) + (ipv6[0]*ipv6[1]) + (saas_breakout[0]*saas_breakout[1]) + (branch_hosted_vnfs[0]*branch_hosted_vnfs[1]) + (automated_security_service_insertion[0]*automated_security_service_insertion[1]) + (conext_aware_security_analytics[0]*conext_aware_security_analytics[1]))/6.to_f).round(1)
    nuage_sdn_total = (((independent_vsd_cluster[0]*independent_vsd_cluster[1]) + (vrsk[0]*vrsk[1]) + (vrsh[0]*vrsh[1]) + (vrsv[0]*vrsv[1]))/4.to_f).round(1)
    vsc_orchestration_total = (((telco_cloud[0]*telco_cloud[1]) + (cms1[0]*cms1[1]) + (cms2[0]*cms2[1]) + (cms3[0]*cms3[1]) + (openshift[0]*openshift[1]) + (containers[0]*containers[1]))/6.to_f).round(1)
    vsc_nokiahw_total = (((wbx_210[0]*wbx_210[1]) + (nokia_7750[0]*nokia_7750[1]) + (ale_switches[0]*ale_switches[1]))/3.to_f).round(1)
    vsc_advanced_total = (((traffic_steering[0]*traffic_steering[1]) + (advanced_policies[0]*advanced_policies[1]) + (reporting[0]*reporting[1]) + (multiple_domains[0]*multiple_domains[1]) + (dpdk[0]*dpdk[1]) + (sriov[0]*sriov[1]))/6.to_f).round(1)
    vsc_integrations_total = (((datacenter_switches[0]*datacenter_switches[1]) + (firewalls[0]*firewalls[1]) + (load_balancers[0]*load_balancers[1]) + (syslog_server[0]*syslog_server[1]) + (bgp_peering[0]*bgp_peering[1]) + (api_integration[0]*api_integration[1]) + (nokia_7750_router_integration[0]*nokia_7750_router_integration[1]))/7.to_f).round(1)

    # Results of the complexity coeficients
    # business_total
    vsp_total = nuage_base_total
    vns_total = nuage_sdwan_total + vns_standard_total + vns_advanced_total + vns_enhanced_total
    vsc_total = nuage_sdn_total + vsc_orchestration_total + vsc_nokiahw_total + vsc_advanced_total + vsc_integrations_total

    grand_total = (((2*business_total) + (2*vsp_total) + (1*vns_total) + (2*vsc_total))/4.to_f).round(1)

    if revenue[1] == 0
      total = 0
    elsif migration == 1
      total = (grand_total*0.5).round(1)
    elsif vertical[1] == 1
      total = (grand_total*0.7).round(1)
    elsif vertical[1] == 2
      total = (grand_total*0.8).round(1)
    else
      total = grand_total
    end

    params[:quote][:complexity_coeficient] = total

    # Services Base
    # Design - base Hours

    design_di_hours = [4,16,24,16,16,2,16]
    design_la_hours = Array.new
    design_ni_hours = Array.new
    design_tpm_hours = Array.new

    for h in design_di_hours do
      design_la_hours.push(h*0.1)
      design_ni_hours.push(h*0.2)
    end

    #print design_la_hours
    #print design_di_hours
    #print design_ni_hours

    i = 0
    for h in design_di_hours do
      design_tpm_hours.push((design_di_hours[i]+design_la_hours[i]+design_ni_hours[i])*0.2)
      i=i+1
    end

    #print design_tpm_hours

    #print "\n"

    # Install - base Hours

    install_di_hours = Array.new
    install_la_hours = Array.new
    install_ni_hours = [8,16,16,16,0,0,0,0,0,16,8,16,16]
    install_tpm_hours = Array.new

    if include_sdn == 1
      install_ni_hours[4] = 24
    end

    if include_sdwan == 1
      install_ni_hours[5] = 16
    end

    if vns_portal[1] == 1
      install_ni_hours[6] = 8
    end

    if notification_app[1] == 1
      install_ni_hours[7] = 8
    end

    if nokia_7750_router_integration[1] == 1
      install_ni_hours[8] = 16
    end

    for h in install_ni_hours do
      install_la_hours.push(h*0.05)
      install_di_hours.push(h*0.1)
    end

    install_di_hours[0] = 8
    install_di_hours[1] = 2

    #print install_la_hours
    #print install_di_hours
    #print install_ni_hours

    i = 0
    for h in install_ni_hours do
      install_tpm_hours.push((install_di_hours[i]+install_la_hours[i]+install_ni_hours[i])*0.2)
      i=i+1
    end

    #print install_tpm_hours

    #total = get_complexity()

    # Services Quote
    i = 0
    for h in design_la_hours do
      design_la_hours[i] = design_la_hours[i]*(total/2)
      design_di_hours[i] = design_di_hours[i]*(total/2)
      design_ni_hours[i] = design_ni_hours[i]*(total/2)
      design_tpm_hours[i] = design_tpm_hours[i]*(total/2)
      i=i+1
    end
    #print design_la_hours
    #print design_di_hours
    #print design_ni_hours
    #print design_tpm_hours

    #print "\n"

    i = 0
    for h in install_la_hours do
      install_la_hours[i] = install_la_hours[i]*total
      install_di_hours[i] = install_di_hours[i]*total
      install_ni_hours[i] = install_ni_hours[i]*total
      install_tpm_hours[i] = install_tpm_hours[i]*total
      i=i+1
    end

    #print install_la_hours
    #print install_di_hours
    #print install_ni_hours
    #print install_tpm_hours

    #print "\n"

    design_la_hours_total = 0
    design_di_hours_total = 0
    design_ni_hours_total = 0
    design_tpm_hours_total = 0

    i = 0
    for h in design_la_hours do
      design_la_hours_total+=design_la_hours[i]
      design_di_hours_total+=design_di_hours[i]
      design_ni_hours_total+=design_ni_hours[i]
      design_tpm_hours_total+=design_tpm_hours[i]
      i=i+1
    end
    #print design_la_hours_total
    #print design_di_hours_total
    #print design_ni_hours_total
    #print design_tpm_hours_total

    #print "\n"

    install_la_hours_total = 0
    install_di_hours_total = 0
    install_ni_hours_total = 0
    install_tpm_hours_total = 0

    i = 0
    for h in install_la_hours do
      install_la_hours_total+=install_la_hours[i]
      install_di_hours_total+=install_di_hours[i]
      install_ni_hours_total+=install_ni_hours[i]
      install_tpm_hours_total+=install_tpm_hours[i]
      i=i+1
    end

    #print install_la_hours_total
    #print install_di_hours_total
    #print install_ni_hours_total
    #print install_tpm_hours_total

    #print "\n"

    design_services_total = (design_la_hours_total*la_cost) + (design_di_hours_total*di_cost) + (design_ni_hours_total*ni_cost) + (design_tpm_hours_total*tpm_cost)
    install_services_total = (install_la_hours_total*la_cost) + (install_di_hours_total*di_cost) + (install_ni_hours_total*ni_cost) + (install_tpm_hours_total*tpm_cost)

    #print design_services_total
    #print install_services_total

    #print "\n"

    # Travel Cost per Week

    if cluster[1] == 1
      travel_expense_percentage = 0.05
    elsif cluster[1] == 2
      travel_expense_percentage = 0.10
    elsif cluster[1] == 3
      travel_expense_percentage = 0.15
    elsif cluster[1] == 4
      travel_expense_percentage = 0.20
    elsif cluster[1] == 5
      travel_expense_percentage = 0.25
    else
      travel_expense_percentage = 0
    end

    executive_travel_total = (design_services_total + install_services_total)*travel_expense_percentage
    national_travel_total = national_travel*weeks_national_travel
    international_travel_total = international_travel*weeks_international_travel
    travel_expenses_total = executive_travel_total + national_travel_total + international_travel_total

    #print executive_travel_total
    #print national_travel_total
    #print international_travel_total
    #print travel_expenses_total

    #print "\n"

    total_cost = design_services_total + install_services_total + travel_expenses_total

    params[:quote][:design_services_total] = design_services_total
    params[:quote][:install_services_total] = install_services_total
    params[:quote][:travel_expenses_total] = travel_expenses_total
    params[:quote][:total_cost] = total_cost
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quote
      @quote = Quote.find(params[:id])
    end

    # List of data for the select inputs fields
    def get_selects_info
      @nuage_versions = NuageVersion.all
      @ha_models = HaModel.all
      @verticals = Vertical.all
      @qty_ranges = QtyRange.all
      @revenues = Revenue.all
      @regions = Region.all
      @cmss = CloudManagementSystem.all
    end
end
