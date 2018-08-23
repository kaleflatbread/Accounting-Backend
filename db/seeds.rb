
income_statement = Account.create({name: "Income Statement", number: "0001"})
balance_sheet = Account.create({name: "Balance Sheet", number: "0002"})
revenue = Account.create({name: "Revenue", number: "4000", parent_id: income_statement.id})
cogs = Account.create({name: "COGS", number: "5000", parent_id: income_statement.id})
g_and_a = Account.create({name: "General and Administrative Expense", number: "6000", parent_id: income_statement.id})
cash = Account.create({name: "Cash", number: "1000", parent_id: balance_sheet.id})
finished_goods = Account.create({name: "Finished Goods", number: "1100", parent_id: balance_sheet.id})


kayla = User.create({email: "test1@gmail.com", first_name: "Kayla", last_name: "Fitzgerald", role: "Staff Accountant", password: "password"})
vicki = User.create({email: "test2@gmail.com", first_name: "Vicki", last_name: "Zhang", role: "Controller", password: "password"})
madison = User.create({email: "test3@gmail.com", first_name: "Madison", last_name: "O'Connor", role: "Accounting Manager", password: "password"})
jing = User.create({email: "test4@gmail.com", first_name: "Jing", last_name: "Bian", role: "Senior Accountant", password: "password"})
dobby = User.create({email: "dobby@gmail.com", first_name: "Dobby", last_name: "Fitzgerald", role: "Cutest one in the office", password: "password"})
