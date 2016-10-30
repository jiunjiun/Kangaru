# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:

# Add Company
company = Company.create name: 'DevChat'

# Add User
user = company.users.create email: 'user@user.com', password: '12345678'

# Add Adapter Line
adapter_line = company.adapter_line.update secret: '21457c1a4c5e9a585bb98f26b15ebf35', access_token: 'zXT5NITgiaajvgNoRLxxFVmm9R8eajGJ07gP5/cdL0o6RXgX3EX5uRODz0p86AstGpFaIenoFxCIBdeRJLTRu3z335LdDMIVvk9dglT05Npi/1n0qichzGiYrg3A73Ty8017rNqcffdqZQZHDNPkSwdB04t89/1O/w1cDnyilFU='

adapter = company.adapters.first

# receive
# Message.create kind: KeyValues::MessageKind.find_by_code('receive').id,

opts = {
  message: {type: :text, text: '你好!'},
  visitor: {user_id: 'U3cf7b54983989ca6b0a587a19cdfa13d'}
}

Message.receive user, adapter, opts

opts = {
  message: {type: :text, text: 'haha'},
  visitor: {user_id: 'U3cf7b54983989ca6b0a587a19cdfa13d'}
}

Message.push user, opts


# -- test
# user = Company.last.users.last
# adapter = Company.last.adapters.first

# opts = {
#   message: {type: :text, text: 'haha'},
#   visitor: {user_id: 'U3cf7b54983989ca6b0a587a19cdfa13d'}
# }

# Message.push user, opts
