require "mysql2"
module MysqlDatabase
  	def self.start_connection(db_host,db_user,db_pass,db_name)
    	begin
			$MySQL2_Client = Mysql2::Client.new(:host => db_host, :username => db_user, :password => db_pass, :database => db_name)
			puts "Successfully connected to MySQL Database"
		rescue Mysql2::Error
  			puts "Error! Cannot connect to MySQL Database."
  			exit 1
		end    	
  	end
end