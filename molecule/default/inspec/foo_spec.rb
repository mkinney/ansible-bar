control "foo" do
  impact 1.0
  title "See if foo file exists"
  desc "Simplest inspec possible."

  describe file('c:\foo.conf') do
    it { should exist }
  end
end

