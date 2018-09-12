# # encoding: utf-8

# Inspec test for recipe bioelite_cronlock::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

unless os.windows?
  describe file('/etc/cronlock.conf') do
    it { should exist }
    its('content') { should match('CRONLOCK_HOST') }
  end

  describe file('/usr/bin/cronlock') do
    it { should exist }
    its('mode') { should cmp '0755' }
  end
end
