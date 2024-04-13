#(1..20).each do |index|
# Company.create(company_code: "CODE_#{index}", company_name: "ABC", address: " HA NOI", email: "email#{index}@gmail.com", phone: '0123456789', website:"vti.edu.vn", status: "working")
#end

#(1..10).each do |index|
#Branch.create(branch_code: "CODE#{index}", branch_name: "HN", company_code: "CODE_#{index}", company_name: "ABC", address: " HA NOI", area: "MIEN BAC",  email: "email#{index}@gmail.com", phone: '0123456789', website:"vti.edu.vn", status: "working")
#end

(1..10).each do |index|
  Division.create(company_code: "CODE#{index}", company_name: "ABC", branch_code: "CODE#{index}", branch_name: "HN", division_code: "CODE#{index}", division_name: "ABC", address: " HA NOI", area: "MIEN BAC",  email: "email#{index}@gmail.com", phone: '0123456789')
end