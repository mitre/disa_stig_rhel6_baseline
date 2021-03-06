control "V-38593" do
  title "The Department of Defense (DoD) login banner must be displayed
immediately prior to, or as part of, console login prompts."
  desc  "An appropriate warning message reinforces policy awareness during the
logon process and facilitates possible legal action against attackers."
  impact 0.5
  tag "gtitle": "SRG-OS-000228"
  tag "gid": "V-38593"
  tag "rid": "SV-50394r3_rule"
  tag "stig_id": "RHEL-06-000073"
  tag "fix_id": "F-43540r3_fix"
  tag "cci": ["CCI-001384", "CCI-001385", "CCI-001386", "CCI-001387",
"CCI-001388"]
  tag "nist": ["AC-8 c 1", "AC-8 c 2", "AC-8 c 2", "AC-8 c 2", "AC-8 c 3",
"Rev_4"]
  tag "false_negatives": nil
  tag "false_positives": nil
  tag "documentable": false
  tag "mitigations": nil
  tag "severity_override_guidance": false
  tag "potential_impacts": nil
  tag "third_party_tools": nil
  tag "mitigation_controls": nil
  tag "responsibility": nil
  tag "ia_controls": nil
  tag "check": "To check if the system login banner is compliant, run the
following command:

$ cat /etc/issue


Note: The full text banner must be implemented unless there are character
limitations that prevent the display of the full DoD logon banner.

If the required DoD logon banner is not displayed, this is a finding.
"
  tag "fix": "To configure the system login banner:

Edit \"/etc/issue\". Replace the default text with a message compliant with the
local site policy or a legal disclaimer. The DoD required text is either:

\"You are accessing a U.S. Government (USG) Information System (IS) that is
provided for USG-authorized use only. By using this IS (which includes any
device attached to this IS), you consent to the following conditions:
-The USG routinely intercepts and monitors communications on this IS for
purposes including, but not limited to, penetration testing, COMSEC monitoring,
network operations and defense, personnel misconduct (PM), law enforcement
(LE), and counterintelligence (CI) investigations.
-At any time, the USG may inspect and seize data stored on this IS.
-Communications using, or data stored on, this IS are not private, are subject
to routine monitoring, interception, and search, and may be disclosed or used
for any USG-authorized purpose.
-This IS includes security measures (e.g., authentication and access controls)
to protect USG interests--not for your personal benefit or privacy.
-Notwithstanding the above, using this IS does not constitute consent to PM, LE
or CI investigative searching or monitoring of the content of privileged
communications, or work product, related to personal representation or services
by attorneys, psychotherapists, or clergy, and their assistants. Such
communications and work product are private and confidential. See User
Agreement for details.\"

If the device cannot support the full DoD logon banner due to character
limitations, the following text can be used:

\"I've read & consent to terms in IS user agreem't.\""

  banner_text = file('/etc/issue').content.gsub(%r{[\r\n\s]}, '')

  describe "Banner text" do
    subject { banner_text }
    it { should eq input('banner_text').gsub(%r{[\r\n\s]}, '') }
  end
end

