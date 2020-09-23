# copyright: 2018, The Authors

# # you add controls here
# control "tmp-1.0" do                        # A unique ID for this control
#   impact 0.7                                # The criticality, if this control fails.
#   title "Create /tmp directory"             # A human-readable title
#   desc "An optional description..."
#   describe file("/tmp") do                  # The actual test
#     it { should be_directory }
#   end
# end

control "CSG-SUDO-A1" do
    impact 0.7
    title "check sudo version in linux"
    describe package('sudo') do
      it { should be_installed }
      its('version') { should cmp >='1.8.23' }
    end
end

control "CSG-SUDO-B3" do
    impact 0.7
    title "not permit root login"
    describe sshd_config do
        its('PermitRootLogin') { should cmp 'no' }
    end
end

control "CSG-SUDO-B7" do
    impact 0.7
    title "disable root access"
    describe file('/etc/securetty') do
      its('size') { should be 0 }
    end
end

control "CSG-SUDO-C3" do
    impact 0.7
    title "only root account has UID 0"
    describe passwd.uids(0) do
      its('users') { should cmp 'root' }
      its('count') { should eq 1 }
    end
end

control "CSG-SUDO-C4" do
    impact 0.7
    title "only root account has GID 0"
    describe passwd.gids(0) do
      its('users') { should cmp 'root' }
      its('count') { should eq 1 }
    end
end

control "CSG-SUDO-E7" do
    impact 0.7
    title "sudoers file permission"
    describe file('/etc/sudoers') do
        its('mode') { should cmp '0440'}
        its('owner') { should eq 'root' }
    end
end


