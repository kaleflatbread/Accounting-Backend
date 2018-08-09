
income_statement = Account.create({name: "Income Statement", number: "0001"})
balance_sheet = Account.create({name: "Balance Sheet", number: "0002"})
revenue = Account.create({name: "Revenue", number: "4000", parent_id: income_statement.id})
cogs = Account.create({name: "COGS", number: "5000", parent_id: income_statement.id})
g_and_a = Account.create({name: "General and Administrative Expense", number: "6000", parent_id: income_statement.id})
cash = Account.create({name: "Cash", number: "1000", parent_id: balance_sheet.id})
finished_goods = Account.create({name: "Finished Goods", number: "1100", parent_id: balance_sheet.id})


kayla = User.create({email: "test1@gmail.com", first_name: "Kayla", last_name: "Fitzgerald", role: "Staff Accountant"})
vicki = User.create({email: "test2@gmail.com", first_name: "Vicki", last_name: "Zhang", role: "Controller"})
madison = User.create({email: "test3@gmail.com", first_name: "Madison", last_name: "O'Connor", role: "Accounting Manager"})
jing = User.create({email: "test4@gmail.com", first_name: "Jing", last_name: "Bian", role: "Senior Accountant"})


one = Expense.create({account_id: revenue.id, transaction_type: "Journal Entry", user_id: madison.id, memo: "July 2018 revenue", date: Date.strptime("7/31/2018", "%m/%d/%Y"), amount: 500})
two = Expense.create({account_id: cash.id, transaction_type: "Journal Entry", user_id: madison.id, memo: "July 2018 revenue", date: Date.strptime("7/31/2018", "%m/%d/%Y"), amount: -500})

three = Inventory.create({account_id: finished_goods.id, transaction_type: "Sale", user_id: kayla.id, memo: "July 2018 cost of goods sold", date: Date.strptime("7/31/2018", "%m/%d/%Y"), quantity_change: -20, amount: -20, cost_per_unit: 1, sku: "ABCD"})
four = Expense.create({account_id: cogs.id, transaction_type: "Sale", user_id: kayla.id, memo: "July 2018 cost of goods sold", date: Date.strptime("7/31/2018", "%m/%d/%Y"), amount: -three.amount})

five = Inventory.create({account_id: finished_goods.id, transaction_type: "Purchase Order", user_id: jing.id, memo: "July 2018 inventory purchase", date: Date.strptime("7/31/2018", "%m/%d/%Y"), quantity_change: 30, amount: 60, cost_per_unit: 2, sku: "EFGH"})
six = Expense.create({account_id: cash.id, transaction_type: "Purchase Order", user_id: jing.id, memo: "July 2018 inventory purchase", date: Date.strptime("7/31/2018", "%m/%d/%Y"), amount: -five.amount})

seven = Expense.create({account_id: g_and_a.id, transaction_type: "Journal Entry", user_id: vicki.id, memo: "July 2018 expense", date: Date.strptime("7/31/2018", "%m/%d/%Y"), amount: 100})
eight = Expense.create({account_id: cash.id, transaction_type: "Journal Entry", user_id: vicki.id, memo: "July 2018 expense", date: Date.strptime("7/31/2018", "%m/%d/%Y"), amount: -100})
