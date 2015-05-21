module PrvdrIndvdlIdTbl
  	
  	def self.insert_records(count)
    	
    	@count 			= count
    	@table_name 	= "prvdr_indvdl_id_tbl"
    	@primary_key 	= "ID"
      @time_now     = Time.now.to_i

    	puts "Working on #{@table_name}"

    	# Get Last Record in Database
		@last_id_before_count = ProjectMockData.last_mysql_table_record(@table_name,@primary_key)
		p @last_id_before_count
		# Insert Records
    File.open("#{@table_name}_#{@time_now}.txt", "w") do |file|
		for k in 1..@count
			@ID 						= (k + @last_id_before_count.to_i).to_s
			@PRVDR_SRC_ID				= ["05302","05302","05302","05302","05302","NPPES","05302"].sample
			@PRVDR_ID 					= ProjectMockData.alpha_numeric_number()
			@PRVDR_CREATN_TMESTMP		= Faker::Time.forward(12, :morning).strftime("%Y-%m-%d").to_s
			@PRVDR_INDVDL_BIRTH_DT		= ProjectMockData.birth_date_yyyy_mm_dd()
			@PRVDR_INDVDL_SSN_ID		= ProjectMockData.generate_ssn()
			@PRVDR_INDVDL_IRS_ID		= ProjectMockData.generate_ssn()
			@PRVDR_INDVDL_DEATH_DT		= "2099-12-31"
			@PRVDR_GRP_PRCTC_ID			= ""

      file.write("INSERT INTO 'Project_STG'.'PRVDR_INDVDL_ID_TBL' (PRVDR_SRC_ID, PRVDR_ID, PRVDR_CREATN_TMESTMP, PRVDR_INDVDL_BIRTH_DT, PRVDR_INDVDL_SSN_ID, PRVDR_INDVDL_IRS_ID, PRVDR_INDVDL_DEATH_DT) VALUES ('#{@PRVDR_SRC_ID}', '#{@PRVDR_ID}', TO_TIMESTAMP('#{@PRVDR_CREATN_TMESTMP} 19:39:29.052000000', 'YYYY-MM-DD HH24:MI:SS.FF'), TO_DATE('#{@PRVDR_INDVDL_BIRTH_DT} 19:39:37', 'YYYY-MM-DD HH24:MI:SS'), '#{@PRVDR_INDVDL_SSN_ID}', '#{@PRVDR_INDVDL_IRS_ID}', TO_DATE('#{@PRVDR_INDVDL_DEATH_DT} 19:50:24', 'YYYY-MM-DD HH24:MI:SS'));\n")
			
      $MySQL2_Client.query("INSERT INTO prvdr_indvdl_id_tbl (ID,PRVDR_SRC_ID,PRVDR_ID,PRVDR_CREATN_TMESTMP,PRVDR_INDVDL_BIRTH_DT,PRVDR_INDVDL_SSN_ID,PRVDR_INDVDL_IRS_ID,PRVDR_INDVDL_DEATH_DT,PRVDR_GRP_PRCTC_ID) VALUES ('#{@ID}','#{@PRVDR_SRC_ID}','#{@PRVDR_ID}','#{@PRVDR_CREATN_TMESTMP}','#{@PRVDR_INDVDL_BIRTH_DT}','#{@PRVDR_INDVDL_SSN_ID}','#{@PRVDR_INDVDL_IRS_ID}','#{@PRVDR_INDVDL_DEATH_DT}','#{@PRVDR_GRP_PRCTC_ID}')")

   			puts "Success! #{@table_name}, #{@primary_key} : #{@ID}"
   		end
    end

   		# Get Last Record in Database
		@last_id_after_count = ProjectMockData.last_mysql_table_record(@table_name,@primary_key)

		# Summary
   		puts "*** #{@table_name} Summary ***"
   		puts "ID before Count: #{@last_id_before_count}"
   		puts "Count: #{@count}"
   		puts "ID after Count: #{@last_id_after_count}"
   		puts "* * * * * *"
   		puts
  	end

end