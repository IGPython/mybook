class BankAccount
	def initialize(first_name, last_name)
		@balance = 0
		@first_name = first_name
		@last_name = last_name
	end

	def deposit(amount)
		@balance += amount
		puts "you have just made a deposit of #{amount}"
	end

	def withdraw(amount)
		@balance -= amount
		puts " You have just made a withdrawl of #{amount}"
	end
end

