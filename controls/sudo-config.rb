# copyright: 2018, The Authors

title "linux sudo related configurations"

# # you add controls here
# control "tmp-1.0" do                        # A unique ID for this control
#   impact 0.7                                # The criticality, if this control fails.
#   title "Create /tmp directory"             # A human-readable title
#   desc "An optional description..."
#   describe file("/tmp") do                  # The actual test
#     it { should be_directory }
#   end
# end

control "sudo-version" do
    impact 0.7
    title "check sudo version in rhel"
    describe package('sudo') do
      it { should be_installed }
      its('version') { should eq '1.8.23-4.el7.x86_64' }
    end
end