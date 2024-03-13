(1..20).each do |index|
  Company.create(company_code: "CODE_#{index}", company_name: "ABC", address: " HA NOI", email: "email#{index}@gmail.com", phone: '0123456789', website:"vti.edu.vn", status: "working")
end