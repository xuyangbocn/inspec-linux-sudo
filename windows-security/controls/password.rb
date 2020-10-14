control 'windows-001' do
  title 'Ensure \'Enforce password history\' is set to \'24 or more password(s)\''
  desc 'This policy setting determines the number of renewed, unique passwords that have to be associated with a user account before you can reuse an old password. The value for this policy setting must be between 0 and 24 passwords. The default value for Windows Vista is 0 passwords, but the default setting in a domain is 24 passwords. To maintain the effectiveness of this policy setting, use the Minimum password age setting to prevent users from repeatedly changing their password.
  The recommended state for this setting is: 24 or more password(s).'
  impact 1.0
  describe security_policy do
    its('PasswordHistorySize') { should be >= attribute('password_history_size') }
  end
end

control 'windows-002' do
  title 'Ensure \'Maximum password age\' is set to \'60 or fewer days, but not 0\''
  desc 'This policy setting defines how long a user can use their password before it expires.
  Values for this policy setting range from 0 to 999 days. If you set the value to 0, the password will never expire.
  Because attackers can crack passwords, the more frequently you change the password the less opportunity an attacker has to use a cracked password. However, the lower this value is set, the higher the potential for an increase in calls to help desk support due to users having to change their password or forgetting which password is current.
  The recommended state for this setting is 60 or fewer days, but not 0.'
  impact 1.0

  describe security_policy do
    its('MaximumPasswordAge') { should be <= attribute('maximum_password_age') }
  end
  describe security_policy do
    its('MaximumPasswordAge') { should be > 0 }
  end
end

control 'windows-003' do
  title 'Ensure \'Minimum password age\' is set to \'1 or more day(s)\''
  desc 'This policy setting determines the number of days that you must use a password before you can change it. The range of values for this policy setting is between 1 and 999 days. (You may also set the value to 0 to allow immediate password changes.) The default value for this setting is 0 days.
  The recommended state for this setting is: 1 or more day(s).'
  impact 1.0
  describe security_policy do
    its('MinimumPasswordAge') { should be >= 1 }
  end
end