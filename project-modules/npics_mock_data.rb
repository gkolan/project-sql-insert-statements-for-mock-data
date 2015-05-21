module ProjectMockData
	
	def self.alpha_numeric_number
		alphabet = ["A","B","C","D"].sample
		numbers = rand.to_s[2..5].to_i
		return "000" + alphabet.to_s + numbers.to_s
	end

	def self.birth_date_yyyy_mm_dd
		number = rand((365*25)..(365*70))
		return  Faker::Time.backward(number, :evening).strftime("%Y-%m-%d")
	end

	def self.last_updated_date_yyyy_mm_dd
		number = rand((365*5)..(365*15))
		return  Faker::Time.backward(number, :evening).strftime("%Y-%m-%d")
	end

	def self.last_updated_timestamp
		number = rand((365*5)..(365*15))
		return  Faker::Time.backward(number, :evening).strftime("%Y-%m-%d")
	end

	def self.generate_ssn
		return Faker::Medical::SSN.ssn.gsub("-","")
	end

	def self.last_mysql_table_record(table_name,primary_key)
    	last_record = $MySQL2_Client.query("SELECT #{primary_key} FROM #{table_name} ORDER BY #{primary_key} DESC LIMIT 1;")
    	if last_record.size > 0
    		return last_record.map { |a| a["#{primary_key}"] }[0]
    	else
    		return 0
    	end 
	end

end