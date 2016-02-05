require 'csv'
scientists = []
grants = []

roles = ["project_leader", "project_manager"]



SmarterCSV.process Rails.root.join("data", "set2.csv"),
  :keymapping => {
    :"project_title_/_titre_du_projet" => :project_title,
    :"project_leader_/_responsable_du_projet" => :project_leader,
    :"project_managers_/_gestionnaires_de_projet" => :project_manager,
    :"maximum_cfi_contribution_/_contribution_maximale_de_la_fci" => :max_CFI,
    :"final_decision_/_décision_finale" => :final_decision,
    :"institution_/_Établissement" => :institution
  },
  :ignore_unmapped_keys => true do |row|
    data = row[0]
    if !(scientists.include? data[:"project_leader_/_responsable_du_projet"] and scientists.include? data[:"project_managers_/_gestionnaires_de_projet"])
      if scientists.include? data[:"project_leader_/_responsable_du_projet"]
        Scientist.create!(
          :name => data[:"project_leader_/_responsable_du_projet"].to_s
        )
        scientists.push row[0][:"project_leader_/_responsable_du_projet"].to_s
      end
      if scientists.include? data[:"project_managers_/_gestionnaires_de_projet"]
        Scientist.create!(
          :name => data[:"project_managers_/_gestionnaires_de_projet"].to_s
        )
        scientists.push row[0][:"project_managers_/_gestionnaires_de_projet"].to_s
      end
    end
    m_CFI = data[:"maximum_cfi_contribution_/_contribution_maximale_de_la_fci"]
    byebug
    m_CFI[0] = ""
    m_CFI.split(",").join("")
    final_max_CFI = m_CFI.split(" ")
      Grant.create!(
        :project_title => data[:"project_title_/_titre_du_projet"],
        :max_CFI => final_max_CFI[0],
        :final_decision => data[:"final_decision_/_décision_finale"],
        :institution => data[:"institution_/_Établissement"]
      )
      Granting.create!(
        :grant => Grant.last,
        :scientist => Scientist.find_by_name(data[:"project_leader_/_responsable_du_projet"]),
        :role => "project_leader"
      )
      Granting.create!(
        :grant => Grant.last,
        :scientist => Scientist.find_by_name(data[:"project_managers_/_gestionnaires_de_projet"]),
        :role => "project_manager"
      )
  end
