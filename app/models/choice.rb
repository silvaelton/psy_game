class Choice < ActiveRecord::Base

  belongs_to :user

  before_create :set_data
  before_create :set_round

  STEP_1 = 10
  STEP_2 = 40
  STEP_3 = 40

  def self.point_round_1(choice)
    Choice.where(group_id: choice.group_id, user_id: choice.user_id, round_id: 1, user_choice: 'object').count
  end

  def self.point_round_2(choice)
    @choices = Choice.where(group_id: choice.group_id, user_id: choice.user_id, round_id: 2)
    
    @objects = @choices.where(user_choice: 'object')
    @objects = @choices.count / 4

    @animals = @choices.where(user_choice: 'animal')
    @animals = @animals.count / 2

    @humans  = @choices.where(user_choice: 'human').count
    @animals + @objects + @humans
  end

  def self.point_round_3(choice)
    @choices = Choice.where(group_id: choice.group_id, user_id: choice.user_id, round_id: 3)
    
    @animals = @choices.where(user_choice: 'animal')
    @animals = @animals.count / 2

    @humans  = @choices.where(user_choice: 'human').count
    @animals + @objects + @humans

  end  


  def self.point_cpu_round_1(choice)
    case choice.group_id
    when 1
      0
    when 2
      @choices = Choice.where(group_id: choice.group_id, user_id: choice.user_id, round_id: 1, computer_choice: 'object').count
    when 3
    end
  end

  def self.point_cpu_round_2(choice)

    case choice.group_id
    when 1
      0
    when 2
      @choices = Choice.where(group_id: choice.group_id, user_id: choice.user_id, round_id: 2, computer_choice: "object").count 
      @choices / 4
    when 3

    end
     
  end

  def self.point_cpu_round_3(choice) 
    case choice.group_id
    when 1
      0
    when 2
      0
    when 3

    end
  end
  

  private

  def set_round
    self.round_id = 2 if self.step_id > STEP_1
    self.round_id = 3 if self.step_id > STEP_2
  end

  def set_data
    case self.group_id
    when 2
      self.computer_choice = 'object'
    when 3
    end
  end
end
