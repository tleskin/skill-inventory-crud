require_relative '../test_helper'

class SkillTest < Minitest::Test

  def test_skill_is_assigned_correct_attributes
  skill = Skill.new({:name => "skill_name",
                     :status => "skill_status",
                     :id => 1})
  assert_equal "skill_name", skill.name
  assert_equal "skill_status", skill.status
  assert_equal 1, skill.id
  end
end
