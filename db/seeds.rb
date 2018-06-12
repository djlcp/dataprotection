['Guidance', 'GDPR', 'Data Protection Authority (Jersey) Law 2018', 'Data Protection (Registration and Charges) (Jersey) Regulations 2018', 'Data Protection (Jersey) Law 2018'].each do |group|
  Group.create(title: group)
end

[
  'Introductory',
  'Fundamental Duties of Controllers',
  'Other Duties of Controllers',
  'Joint Security Duty and Duties of Processors',
  'Data Protection Officer',
  'Rights of Data Subjects',
  'Division 1 – General and Wider Exemptions',
  'Division 2 – Exemptions from Transparency and Subject Rights Provisions',
  'Division 3 – Exceptions to Article 27 or 28',
  'Division 4 – Permissions and Exemptions by Regulations',
  'Cross-border Data Transfers',
  'Remedies and Enforcement',
  'Miscellaneous'
].each do |category|
  Category.create(title: category, group: Group.find_by(title: 'Data Protection (Jersey) Law 2018'))
end

[
  'Introductory and Setting up of Authority',
  'Functions of Authority',
  'Registration and Charges',
  'Enforcement by Authority',
  'Administrative Provisions',
  'Closing Provisions',
  'Powers of Investigation and Inquiry',
  'Transitional Provisions',
  'Consequential Amendments'
].each do |category|
  Category.create(title: category, group: Group.find_by(title: 'Data Protection Authority (Jersey) Law 2018'))
end

['Regulation'].each do |category|
  Category.create(title: category, group: Group.find_by(title: 'Data Protection (Registration and Charges) (Jersey) Regulations 2018'))
end

['Rectials', 'General Provisions', 'Principles'].each do |category|
  Category.create(title: category, group: Group.find_by(title: 'GDPR'))
end
