class Position < ActiveRecord::Base
  acts_as_xlsx

  before_create :age

  attr_accessible :job_title, :office, :valid_from, :job_grade, :reports_to, :line_manages,
                  :overall_purpose, :scope, :specific_work_env, :conceptual, :implementation,
                  :support, :fte, :unique_position, :permanent, :department, :name,
                  :birth_date, :gender, :nationality, :res_status, :start_date, :type_contract,
                  :next_performance_talk, :age, :competencies_attributes,
                  :attitude1, :attitude2, :attitude3, :attitude4, :attitude5
  has_many :tweets
  has_many :competencies
  accepts_nested_attributes_for :competencies, allow_destroy: true

  def position_status
    if name == ""
      "Vacant"
    else
      "Filled"
    end
  end

  def permanent_outcome
    if permanent == 1
      "permanent"
    else
      "temporarily"
    end
  end

  def name_of_office
    if office == 1
      "International"
    elsif office == 2
      "Netherlands"
    elsif office == 3
      "Germany"
    elsif office == 4
      "Mediterranean"
    elsif office == 5
      "United Kingdom"
    else
      "Unidentified"
    end
  end

  def job_description_title
    'GREENPEACE ' + name_of_office + ' ' + job_title + ' Job Description'
  end

  def attitude1_excel
    unless attitude1 == ''
      '- ' + attitude1
    end
  end

  def attitude2_excel
    unless attitude2 == ''
      '- ' + attitude2
    end
  end

  def attitude3_excel
    unless attitude3 == ''
      '- ' + attitude3
    end
  end

  def attitude4_excel
    unless attitude4 == ''
      '- ' + attitude4
    end
  end

  def attitude5_excel
    unless attitude5 == ''
      '- ' + attitude5
    end
  end

  def age
    if birth_date.nil?
      "0"
    else
      now = Time.now.utc.to_date
      now.year - birth_date.year - ((now.month > birth_date.month || (now.month == birth_date.month && now.day >= birth_date.day)) ? 0 : 1)
    end
  end

end
