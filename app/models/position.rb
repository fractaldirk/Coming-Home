class Position < ActiveRecord::Base
  attr_accessible :job_title, :office, :valid_from, :job_grade, :reports_to, :line_manages,
                  :overall_purpose, :scope, :specific_work_env, :conceptual, :implementation,
                  :support, :fte, :unique_position, :permanent, :department, :name,
                  :birth_date, :gender, :nationality, :res_status, :start_date, :type_contract,
                  :next_performance_talk
  has_many :tweets

  def permanent_outcome
    if permanent = 1
      "permanent"
    else
      "temporarily"
    end
  end
end
