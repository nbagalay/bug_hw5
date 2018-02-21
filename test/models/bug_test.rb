require 'test_helper'

class BugTest < ActiveSupport::TestCase
  def setup
    @bug = Bug.create(title: "A title", description: "test case number 1", priority: 0, status: 0, issue_type: 1)
  end

  test "post must be valid" do 
    assert @bug.valid?
  end

  test "title must be present" do
    @bug.title = ""
    assert_not @bug.valid?
  end

  test "description must be present" do
    @bug.description = ""
    assert_not @bug.valid?
  end

  test "Issue Type must be valid" do
    invalid_issuetype = [-10, -3, 3, 9]
    invalid_issuetype.each do |ib|
      begin
        @bug.issue_type ib
        assert false,  "#{ib} should be invalid"
      rescue
        assert true
      end
    end
  end

  test "priority must be valid" do
    invalid_priority = [-10, -3, 3, 9]
    invalid_priority.each do |ia|
      begin
        @bug.priority ia
        assert false,  "#{ia} should be invalid"
      rescue
        assert true
      end
    end
  end

  test "status must be valid" do
    invalid_statuses = [-10, -3, 3, 9]
    invalid_statuses.each do |is|
      begin
        @bug.status is
        assert false,  "#{is} should be invalid"
      rescue
        assert true
      end
    end
  end

  test "status must open, closed or monitor" do
    valid_statuses = [:open, :closed, :monitor]
    valid_statuses.each do |vs|
      begin
        @bug.status vs
        assert true
      rescue        
        assert false,  "#{vs} should be invalid"
      end
    end
  end

  test "priority must low, medium, high" do
    valid_priority = [:low, :medium, :high]
    valid_priority.each do |va|
      begin
        @bug.priority va
        assert true
      rescue        
        assert false,  "#{va} should be invalid"
      end
    end
  end

  test "issue type must be issue, enhancement or feature" do
    valid_issuetype = [:issue, :enhancement, :feature]
    valid_issuetype.each do |vb|
      begin
        @bug.issue_type vb
        assert true
      rescue        
        assert false,  "#{vb} should be invalid"
      end
    end
  end
end
