# encoding: utf-8
module PrvdrIndvdlIncmgOthrIdTbl
  	
    def self.insert_records(count)
    	 
    	  @count 			   = count
    	  @table_name 	 = "prvdr_indvdl_incmg_othr_id_tbl"
    	  @primary_key 	 = "ID"
        @time_now     = Time.now.to_i

    	  puts "Working on #{@table_name}"

    	  # Get Last Record in Database
		    @last_id_before_count = ProjectMockData.last_mysql_table_record(@table_name,@primary_key)
		    p @last_id_before_count
        # Insert Records
        File.open("#{@table_name}_#{@time_now}.txt", "w") do |file|
        for k in 1..@count
            @ID                           = (k + @last_id_before_count.to_i).to_s
            @PRVDR_OTHR_ID                = ProjectMockData.alpha_numeric_number()
            @PRVDR_LAST_UPDT_DT           = ProjectMockData.last_updated_date_yyyy_mm_dd()
            @PRVDR_INDVDL_INCMG_OTHR_SQNC = (1588244564 + k).to_s
            @PRVDR_OTHR_ID_LAST_UPDT_DT   = ProjectMockData.last_updated_date_yyyy_mm_dd()
            @PRVDR_ID                     = Luhnacy.generate(10).to_s
            @PRVDR_TYPE_ID_CD             = ["01","02","03","04","05","06","07","08","09"].sample
            @GEO_STATE_CD                 = Faker::Address.state_abbr
            @PRVDR_MAX_UPDT_DT            = ProjectMockData.last_updated_date_yyyy_mm_dd()
            
            file.write("INSERT INTO 'Project_INC'.'PRVDR_INDVDL_INCMG_OTHR_ID_TBL' (PRVDR_OTHR_ID, PRVDR_LAST_UPDT_DT, PRVDR_INDVDL_INCMG_OTHR_SQNC, PRVDR_OTHR_ID_LAST_UPDT_DT, PRVDR_ID, PRVDR_TYPE_ID_CD, GEO_STATE_CD, PRVDR_MAX_UPDT_DT) VALUES ('#{@PRVDR_OTHR_ID}', TO_DATE('#{@PRVDR_LAST_UPDT_DT} 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '#{@PRVDR_INDVDL_INCMG_OTHR_SQNC}', TO_DATE('#{@PRVDR_OTHR_ID_LAST_UPDT_DT} 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '#{@PRVDR_ID}', '#{@PRVDR_TYPE_ID_CD}', '#{@GEO_STATE_CD}', TO_DATE('#{@PRVDR_MAX_UPDT_DT} 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));\n")

            $MySQL2_Client.query("INSERT INTO prvdr_indvdl_incmg_othr_id_tbl 
              (ID,PRVDR_OTHR_ID,PRVDR_LAST_UPDT_DT,PRVDR_INDVDL_INCMG_OTHR_SQNC,PRVDR_OTHR_ID_LAST_UPDT_DT,PRVDR_ID,PRVDR_TYPE_ID_CD,GEO_STATE_CD,PRVDR_MAX_UPDT_DT) VALUES ('#{@ID}','#{@PRVDR_OTHR_ID}','#{@PRVDR_LAST_UPDT_DT}','#{@PRVDR_INDVDL_INCMG_OTHR_SQNC}','#{@PRVDR_OTHR_ID_LAST_UPDT_DT}','#{@PRVDR_ID}','#{@PRVDR_TYPE_ID_CD}','#{@GEO_STATE_CD}','#{@PRVDR_MAX_UPDT_DT}')" )

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