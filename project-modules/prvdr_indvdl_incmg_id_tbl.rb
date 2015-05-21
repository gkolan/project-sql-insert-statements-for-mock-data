module PrvdrIndvdlIncmgIdTbl
  	
  	def self.insert_records(count)
    	@count 			   = count
    	@table_name 	 = "prvdr_indvdl_incmg_id_tbl"
    	@primary_key 	 = "ID"
      @time_now     = Time.now.to_i

    	puts "Working on #{@table_name}"

    	# Get Last Record in Database
		@last_id_before_count = ProjectMockData.last_mysql_table_record(@table_name,@primary_key)
		p @last_id_before_count
		# Insert Records
    File.open("#{@table_name}_#{@time_now}.txt", "w") do |file|
		for k in 1..@count
			@ID 						          = (k + @last_id_before_count).to_s
      @PRVDR_ID                 = Luhnacy.generate(10)
      @PRVDR_LAST_UPDT_DT       = ProjectMockData.last_updated_date_yyyy_mm_dd
      @PRVDR_DEACTVTN_TMESTMP   = "2099-12-31 00:00"
      @PRVDR_NPI_ENMRTN_DT      = ["2005-05-05","2005-05-06"].sample
      @PRVDR_STUS_CD            = "A"
      @PRVDR_NPI_DEACTVTN_DT    = "2099-12-31"
      @PRVDR_STUS_RSN_CD        = ["AS","AS","AS","AS","AS","OT","AS"].sample
      @PRVDR_ENT_TYPE_CD        = "I"
      @PRVDR_INDVDL_IRS_ID      = ""
      @PRVDR_INCMG_REC_TYPE_CD  = "U"
      @PRVDR_IRS_ID_UPDT_DT     = "200-01-01"
      @PRVDR_SSN_ID             = ProjectMockData.generate_ssn()
      @PRVDR_SSN_LAST_UPDT_DT   = ProjectMockData.last_updated_date_yyyy_mm_dd
      @PRVDR_INDVDL_BIRTH_DT    = ProjectMockData.birth_date_yyyy_mm_dd()
      @PRVDR_BIRTH_UPDT_DT      = ProjectMockData.last_updated_date_yyyy_mm_dd
      @PRVDR_MAX_UPDT_DT        = ProjectMockData.last_updated_date_yyyy_mm_dd
      @PRVDR_PROC_UPDT_DT       = ProjectMockData.last_updated_date_yyyy_mm_dd
      @PRVDR_UPDT_ID            = ""

      file.write("INSERT INTO 'Project_INC'.'PRVDR_INDVDL_INCMG_ID_TBL' (PRVDR_ID, PRVDR_LAST_UPDT_DT, PRVDR_DEACTVTN_TMESTMP, PRVDR_NPI_ENMRTN_DT, PRVDR_STUS_CD, PRVDR_NPI_DEACTVTN_DT, PRVDR_STUS_RSN_CD, PRVDR_ENT_TYPE_CD, PRVDR_INDVDL_IRS_ID, PRVDR_INCMG_REC_TYPE_CD, PRVDR_IRS_ID_UPDT_DT, PRVDR_SSN_ID, PRVDR_SSN_LAST_UPDT_DT, PRVDR_INDVDL_BIRTH_DT, PRVDR_BIRTH_UPDT_DT, PRVDR_MAX_UPDT_DT, PRVDR_PROC_UPDT_DT, PRVDR_UPDT_ID) VALUES ('#{@PRVDR_ID}', TO_DATE('#{@PRVDR_LAST_UPDT_DT} 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('#{@PRVDR_DEACTVTN_TMESTMP} 19:39:20.052000000', 'YYYY-MM-DD HH24:MI:SS.FF'), TO_DATE('#{@PRVDR_NPI_ENMRTN_DT} 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '#{@PRVDR_STUS_CD}', TO_DATE('#{@PRVDR_NPI_DEACTVTN_DT} 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '#{@PRVDR_STUS_RSN_CD}', '#{@PRVDR_ENT_TYPE_CD}', '#{@PRVDR_INDVDL_IRS_ID}', '#{@PRVDR_INCMG_REC_TYPE_CD}', TO_DATE('#{@PRVDR_IRS_ID_UPDT_DT} 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '#{@PRVDR_SSN_ID}', TO_DATE('#{@PRVDR_SSN_LAST_UPDT_DT} 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('#{@PRVDR_INDVDL_BIRTH_DT} 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('#{@PRVDR_BIRTH_UPDT_DT} 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('#{@PRVDR_MAX_UPDT_DT} 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('#{@PRVDR_PROC_UPDT_DT} 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '#{@PRVDR_UPDT_ID}');\n")

			$MySQL2_Client.query("INSERT INTO prvdr_indvdl_incmg_id_tbl
(ID,PRVDR_ID,PRVDR_LAST_UPDT_DT,PRVDR_DEACTVTN_TMESTMP,PRVDR_NPI_ENMRTN_DT,PRVDR_STUS_CD,PRVDR_NPI_DEACTVTN_DT,PRVDR_STUS_RSN_CD,PRVDR_ENT_TYPE_CD,PRVDR_INDVDL_IRS_ID,PRVDR_INCMG_REC_TYPE_CD,PRVDR_IRS_ID_UPDT_DT,PRVDR_SSN_ID,PRVDR_SSN_LAST_UPDT_DT,PRVDR_INDVDL_BIRTH_DT,PRVDR_BIRTH_UPDT_DT,PRVDR_MAX_UPDT_DT,PRVDR_PROC_UPDT_DT,PRVDR_UPDT_ID) VALUES ('#{@ID}','#{@PRVDR_ID}','#{@PRVDR_LAST_UPDT_DT}','#{@PRVDR_DEACTVTN_TMESTMP}','#{@PRVDR_NPI_ENMRTN_DT}','#{@PRVDR_STUS_CD}','#{@PRVDR_NPI_DEACTVTN_DT}','#{@PRVDR_STUS_RSN_CD}','#{@PRVDR_ENT_TYPE_CD}','#{@PRVDR_INDVDL_IRS_ID}','#{@PRVDR_INCMG_REC_TYPE_CD}','#{@PRVDR_IRS_ID_UPDT_DT}','#{@PRVDR_SSN_ID}','#{@PRVDR_SSN_LAST_UPDT_DT}','#{@PRVDR_INDVDL_BIRTH_DT}','#{@PRVDR_BIRTH_UPDT_DT}','#{@PRVDR_MAX_UPDT_DT}','#{@PRVDR_PROC_UPDT_DT}','#{@PRVDR_UPDT_ID}')")
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